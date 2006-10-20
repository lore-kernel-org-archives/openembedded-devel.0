Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Garr4-0006fP-Kn
	for openembedded-devel@openembedded.org; Fri, 20 Oct 2006 12:43:58 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9KAalFh031061 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 12:36:47 +0200
Message-ID: <4538A6E0.2070501@dominion.kabel.utwente.nl>
Date: Fri, 20 Oct 2006 12:37:20 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1161343579.28578.3.camel@ubuntu>
In-Reply-To: <1161343579.28578.3.camel@ubuntu>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: cvs proxy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 10:43:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leopold Faschalek schreef:
> Hi,
> 
> after installing OE I tried with 'bitbake task-bootstrap' and got
> following output after a second run:
> 
> NOTE: Using cache in '/stuff/tmp/cache'
> NOTE: Handling BitBake files: | (3983/3983) [100 %]
> NOTE: Parsing finished. 3866 cached, 0 parsed, 117 skipped, 0 masked.
> 
> NOTE: build 200610201320: started
> 
> OE Build Configuration:
> BB_VERSION     = "1.6.1"
> OE_REVISION    = "b4deec430ac4a640c372471057dbd7e0973f41e5"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux"
> MACHINE        = "collie"
> DISTRO         = "familiar"
> DISTRO_VERSION = "unstable-20061020"
> TARGET_FPU     = ""
> 
> NOTE: package ipkg-utils-native-1.6+cvs20050404: started
> NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_fetch:
> started
> NOTE: fetch
> http://www.oesources.org/source/current/ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz
> --13:20:50--
> http://www.oesources.org/source/current/ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz
>            =>
> `/home/fale/sources/ipkg-utils_anoncvs.handhelds.org__20050930.tar.gz'
> Connecting to 172.16.10.104:8080... connected.
> Proxy request sent, awaiting response... 504 Proxy Timeout ( The
> connection timed out. For more information about this event, see ISA
> Server Help.  )
> 13:21:11 ERROR 504: Proxy Timeout ( The connection timed out. For more
> information about this event, see ISA Server Help.  ).
> 
> NOTE: Fetch
> cvs://anoncvs:anoncvs@anoncvs.handhelds.org/cvs;module=ipkg-utils
> cvs [checkout aborted]: connect to
> anoncvs.handhelds.org(128.31.0.23):2401 failed: No route to host
> NOTE: Task failed: Fetch failed: ipkg-utils
> NOTE: package ipkg-utils-native-1.6+cvs20050404-r8: task do_fetch:
> failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package ipkg-utils-native-1.6+cvs20050404: failed
> ERROR: Build of task-bootstrap failed
> 
> any suggestions?
> 

Yes, as the output says:

"Connecting to 172.16.10.104:8080... connected.
Proxy request sent, awaiting response... 504 Proxy Timeout ( The
connection timed out. For more information about this event, see ISA
Server Help.  )"

It seems like the proxy on your network is broken.

regards,

Koen




-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFOKbgMkyGM64RGpERAuz1AJwJv9n3kg3p5YT20jHJC4mlwOmwlACfZydY
/rSSw7gbW8S//peL8n7L7S8=
=o93W
-----END PGP SIGNATURE-----


