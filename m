Received: from ramkesd003-e.ra.rockwell.com ([205.175.240.251]
	helo=ramilwsmtp01.ra.rockwell.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mkes@ra.rockwell.com>) id 1SG7EA-0001ip-0L
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 13:21:14 +0200
Received: from cze.ra.rockwell.com ([10.70.136.58])
	by ramilwsmtp01.ra.rockwell.com
	with ESMTP id 2012040606115940-264213 ;
	Fri, 6 Apr 2012 06:11:59 -0500 
Received: (qmail 44373 invoked from network); 6 Apr 2012 11:11:58 -0000
Received: from unknown (HELO [10.70.138.164]) ([10.70.138.164])
	(envelope-sender <mkes@ra.rockwell.com>)
	by euczprgmult004.cze.ra.rockwell.com (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	6 Apr 2012 11:11:58 -0000
Message-ID: <4F7ECF80.6010405@ra.rockwell.com>
Date: Fri, 06 Apr 2012 13:12:00 +0200
From: Miroslav Kes <mkes@ra.rockwell.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120314 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-MIMETrack: Itemize by SMTP Server on RAMilwSMTP01/Milwaukee/RA/Rockwell at
	04/06/2012 06:11:59 AM,
	Serialize by Router on RAMilwSMTP01/Milwaukee/RA/Rockwell at 04/06/2012
	06:12:03 AM, Serialize complete at 04/06/2012 06:12:03 AM
Subject: Re: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 06 Apr 2012 11:21:14 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1

> Hi,
>
> the diff is unreadable, but you could have fixed it by using a patch
> rather than the sed command.
>
> Bye Henning

I'm sorry, it looks like some auto formating tool split the long lines
and made it unreadable. I'm trying again (see bellow).

I've looked closer in the meantime what the sed command was trying to
achieve. The intention was likely to eliminate IPv6 specific cases in
the C switch command erasing everything between the "case AF_INET6:" and
the corresponding "break;"
The problem is that it uses only the "AF_INET6" string in its pattern to
find the first line to be deleted. If the AF_INET6 macro is used in a
different context in the code, it blindly erases everything until the
next break command.

I think that the whole idea of doing it by sed is bad. The IPv6 code is
surrounded by #if OPENSSL_USE_IPV6 ... #endif so the correct approach
would be to ensure that the preprocessor includes or skips that code.


Mira Kes

Here is the diff again:

345,402d344
<         else if (data->peer.sa.sa_family == AF_INET6)
<             peerlen = sizeof(data->peer.sa_in6);
< #endif
< #if defined(NETWARE_CLIB) && defined(NETWARE_BSDSOCK)
<         ret=sendto(b->num, (char *)in, inl, 0, &data->peer.sa, peerlen);
< #else
<         ret=sendto(b->num, in, inl, 0, &data->peer.sa, peerlen);
< #endif
<         }
<
<     BIO_clear_retry_flags(b);
<     if (ret <= 0)
<         {
<         if (BIO_dgram_should_retry(ret))
<             {
<             BIO_set_retry_write(b); 
<             data->_errno = get_last_socket_error();
<
< #if 0 /* higher layers are responsible for querying MTU, if necessary */
<             if ( data->_errno == EMSGSIZE)
<                 /* retrieve the new MTU */
<                 BIO_ctrl(b, BIO_CTRL_DGRAM_QUERY_MTU, 0, NULL);
< #endif
<             }
<         }
<     return(ret);
<     }
<
< static long dgram_ctrl(BIO *b, int cmd, long num, void *ptr)
<     {
<     long ret=1;
<     int *ip;
<     struct sockaddr *to = NULL;
<     bio_dgram_data *data = NULL;
< #if defined(IP_MTU_DISCOVER) || defined(IP_MTU)
<     long sockopt_val = 0;
<     unsigned int sockopt_len = 0;
< #endif
< #ifdef OPENSSL_SYS_LINUX
<     socklen_t addr_len;
<     union    {
<         struct sockaddr    sa;
<         struct sockaddr_in s4;
< #if OPENSSL_USE_IPV6
<         struct sockaddr_in6 s6;
< #endif
<         } addr;
< #endif
<
<     data = (bio_dgram_data *)b->ptr;
<
<     switch (cmd)
<         {
<     case BIO_CTRL_RESET:
<         num=0;
<     case BIO_C_FILE_SEEK:
<         ret=0;
<         break;
451,453d392
<                 case AF_INET6:
<                     memcpy(&data->peer,to,sizeof(data->peer.sa_in6));
<                     break;
483,488d421
<         case AF_INET6:
<             sockopt_val = IPV6_PMTUDISC_DO;
<             if ((ret = setsockopt(b->num, IPPROTO_IPV6, IPV6_MTU_DISCOVER,
<                 &sockopt_val, sizeof(sockopt_val))) < 0)
<                 perror("setsockopt");
<             break;
526,540d458
<         case AF_INET6:
<             if ((ret = getsockopt(b->num, IPPROTO_IPV6, IPV6_MTU,
(void *)&sockopt_val,
<                 &sockopt_len)) < 0 || sockopt_val < 0)
<                 {
<                 ret = 0;
<                 }
<             else
<                 {
<                 /* we assume that the transport protocol is UDP and no
<                  * IPV6 options are used.
<                  */
<                 data->mtu = sockopt_val - 8 - 40;
<                 ret = data->mtu;
<                 }
<             break;
569,571d486
<                 case AF_INET6:
<                     memcpy(&data->peer,to,sizeof(data->peer.sa_in6));
<                     break;
591,593d505
<             case AF_INET6:
<                 ret=sizeof(data->peer.sa_in6);
<                 break;
611,613d522
<             case AF_INET6:
<                 memcpy(&data->peer,to,sizeof(data->peer.sa_in6));
<                 break;



