Received: from ramkesd003-e.ra.rockwell.com ([205.175.240.251]
	helo=ramilwsmtp01.ra.rockwell.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mkes@ra.rockwell.com>) id 1SFl8m-0001x9-AZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 13:46:13 +0200
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: 
References: 
From: Miroslav Kes <mkes@ra.rockwell.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <OF169404D2.136201F5-ONC12579D7.0035BDC1-C12579D7.003FCEB6@ra.rockwell.com>
Date: Thu, 5 Apr 2012 13:36:56 +0200
X-Mailer: Lotus Domino Web Server Release 8.5.2FP3 July 10, 2011
X-MIMETrack: Serialize by HTTP Server on
	RAEMEAMail02/Europe/RA/Rockwell(Release
	8.5.2FP3|July 10, 2011) at 04/05/2012 01:36:56 PM,
	Serialize complete at 04/05/2012 01:36:56 PM,
	Itemize by HTTP Server on RAEMEAMail02/Europe/RA/Rockwell(Release
	8.5.2FP3|July 10, 2011) at 04/05/2012 01:36:56 PM,
	Serialize by Router on RAMilwSMTP01/Milwaukee/RA/Rockwell at 04/05/2012
	06:37:03 AM, Serialize complete at 04/05/2012 06:37:03 AM
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: openssl build broken for distros without IPv6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Apr 2012 11:46:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"

   Hi!
   There is a "feature" in the openembedded/recipes/openssl/openssl.inc
   that criples one of the openssl source files (and breaks the whole
   build) if the distro doesn't support IPv6 .
   do_configure () {
       ...
       eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e
   "/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
   }
   The application of the sed pattern on the ${S}/crypto/bio/bss_dgram.c
   cuts also a piece of code between the middle of the static int
   dgram_write( ... ) function and the middle of the static long
   dgram_ctrl(...) function.
   In other words, the two functions are "merged" in one combining the
   head of the first function body with the tail of the second function
   body (see the first part of the diff bellow)
   If I save a snapshot of the source tree after the patch task and
   compare it with the result of the configure task, the diff looks like:
   diff openssl-1.0.0e.patch/crypto/bio/bss_dgram.c
   openssl-1.0.0e/crypto/bio/bss_dgram.c
   345,402d344



   <               else if (data->peer.sa.sa_family ==
   AF_INET6)


   <                       peerlen =
   sizeof(data->peer.sa_in6);



   <
   #endif



   < #if defined(NETWARE_CLIB) &&
   defined(NETWARE_BSDSOCK)



   <               ret=sendto(b->num, (char *)in, inl, 0, &data->peer.sa,
   peerlen);


   <
   #else



   <               ret=sendto(b->num, in, inl, 0, &data->peer.sa,
   peerlen);


   <
   #endif



   <
   }



   <



   <
   BIO_clear_retry_flags(b);



   <       if (ret <=
   0)



   <
   {



   <               if
   (BIO_dgram_should_retry(ret))



   <
   {



   <
   BIO_set_retry_write(b);



   <                       data->_errno =
   get_last_socket_error();



   <



   < #if 0 /* higher layers are responsible for querying MTU, if necessary
   */


   <                       if ( data->_errno ==
   EMSGSIZE)



   <                               /* retrieve the new MTU
   */


   <                               BIO_ctrl(b, BIO_CTRL_DGRAM_QUERY_MTU,
   0,
   NULL);


   <
   #endif



   <
   }



   <
   }



   <       return(ret);
   <       }
   <
   < static long dgram_ctrl(BIO *b, int cmd, long num, void *ptr)
   <       {
   <       long ret=1;
   <       int *ip;
   <       struct sockaddr *to = NULL;
   <       bio_dgram_data *data = NULL;
   < #if defined(IP_MTU_DISCOVER) || defined(IP_MTU)
   <       long sockopt_val = 0;
   <       unsigned int sockopt_len = 0;
   < #endif
   < #ifdef OPENSSL_SYS_LINUX
   <       socklen_t addr_len;
   <       union   {
   <               struct sockaddr sa;
   <               struct sockaddr_in s4;
   < #if OPENSSL_USE_IPV6
   <               struct sockaddr_in6 s6;
   < #endif
   <               } addr;
   < #endif
   <
   <       data = (bio_dgram_data *)b->ptr;
   <
   <       switch (cmd)
   <               {
   <       case BIO_CTRL_RESET:
   <               num=0;
   <       case BIO_C_FILE_SEEK:
   <               ret=0;
   <               break;
   451,453d392
   <                               case AF_INET6:
   <
   memcpy(&data->peer,to,sizeof(data->peer.sa_in6));
   <                                       break;
   483,488d421
   <               case AF_INET6:
   <                       sockopt_val = IPV6_PMTUDISC_DO;
   <                       if ((ret = setsockopt(b->num, IPPROTO_IPV6,
   IPV6_MTU_DISCOVER,
   <                               &sockopt_val, sizeof(sockopt_val))) <
   0)
   <                               perror("setsockopt");
   <                       break;
   526,540d458
   <               case AF_INET6:
   <                       if ((ret = getsockopt(b->num, IPPROTO_IPV6,
   IPV6_MTU, (void *)&sockopt_val,
   <                               &sockopt_len)) < 0 || sockopt_val < 0)
   <                               {
   <                               ret = 0;
   <                               }
   <                       else
   <                               {
   <                               /* we assume that the transport
   protocol is UDP and no
   <                                * IPV6 options are used.
   <                                */
   <                               data->mtu = sockopt_val - 8 - 40;
   <                               ret = data->mtu;
   <                               }
   <                       break;
   569,571d486
   <                               case AF_INET6:
   <
   memcpy(&data->peer,to,sizeof(data->peer.sa_in6));
   <                                       break;
   591,593d505
   <                       case AF_INET6:
   <                               ret=sizeof(data->peer.sa_in6);
   <                               break;
   611,613d522
   <                       case AF_INET6:
   <
   memcpy(&data->peer,to,sizeof(data->peer.sa_in6));
   <                               break;
   Regards
   Mira Kes

