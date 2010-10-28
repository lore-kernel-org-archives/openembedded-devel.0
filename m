Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBZUZ-0002ry-4Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 22:54:36 +0200
Received: by gyf3 with SMTP id 3so1660785gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 13:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=G9DVUZPclndh99UVeh0vIipaH+rijmOIqeQyzusBIZY=;
	b=HxJ7wbvBc8RrdP6v2BXGR0asE4/fh9HFc3Wb+odfcGM+A/6nKU9QBoX/jDRF9nCWTq
	xjG2apzAJ9FmoyJoT4AsH+o2J+zqsD2S15s/FZgBnixLQuznre86/0UKZcT8O+IgrMIT
	PjzRyTrnjDslSC1DT+yDcZWVxaR7U6hxF/a0w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=odboM8WTN+fF6rHZT0IX65/HQ76tJgb97zWvSgxQrzT8+1k0YtIwSqDLeE0Nu+WQG6
	2sjrWvWTaPJgDnr02J2Kf4LuWnh2mbgvBrBC6PSUOe+QU35qD/GpQfTTnzEpZpz7+ldp
	XR3KR2AaE8hfSyC6ulPf0eq/jEACU4SBl2yvI=
Received: by 10.90.19.18 with SMTP id 18mr3266308ags.106.1288299229624; Thu,
	28 Oct 2010 13:53:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Thu, 28 Oct 2010 13:53:29 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.1010281443540.5082@juice.ott.cti.com>
References: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
	<AANLkTinWpXoGqD5iNN+h-YEN9suQd3zac5E3FTvM7m39@mail.gmail.com>
	<Pine.LNX.4.64.1010281443540.5082@juice.ott.cti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Oct 2010 13:53:29 -0700
Message-ID: <AANLkTikbv9bF9fBvFU2_C6sK13A23wBXgRzwbX++VLhq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] curl: make CURL_FEATURES configurable again
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
X-List-Received-Date: Thu, 28 Oct 2010 20:54:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 28, 2010 at 11:49 AM, Michael Smith <msmith@cbnco.com> wrote:
> On Thu, 28 Oct 2010, Khem Raj wrote:
>
>> -CURL_FEATURES = ${@['zlib,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp','zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp']["${BPN}" == "${PN}"]}
>> +CURL_FEATURES ?= "zlib,gnutls,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"
>> +CURL_FEATURES_virtclass-native = "zlib,cookies,crypto-auth,dict,file,ftp,http,telnet,tftp"
>
>> this change was done for a reason. this will not set correct override
>> for native recipes and we dont want gnutls on native recipe but if you
>> look closely the output then it will enable gnutls because
>> CURL_FEATURES_virtclass-native is ineffective in this case as you
>> already have a weak assignment.
>
> It seems to do the right thing here - CURL_FEATURES_virtclass-native is
> not weak, so in my curl-native config.log, I see --disable-gnutls.

certainly nor for me. here is what I get


oe_runconf() {
        if [ -x
/scratch/oe/work/x86_64-linux/curl-native-7.21.1-r4.1/curl-7.21.1/configure
] ; then

/scratch/oe/work/x86_64-linux/curl-native-7.21.1-r4.1/curl-7.21.1/configure
\
                 --build=x86_64-linux             --host=x86_64-linux
           --target=x86_64-linux
--prefix=/scratch/oe/sysroots/x86_64-linux/usr
--exec_prefix=/scratch/oe/sysroots/x86_64-linux/usr
--bindir=/scratch/oe/sysroots/x86_64-linux/usr/bin
--sbindir=/scratch/oe/sysroots/x86_64-linux/usr/sbin
--libexecdir=/scratch/oe/sysroots/x86_64-linux/usr/libexec
 --datadir=/scratch/oe/sysroots/x86_64-linux/usr/share
  --sysconfdir=/scratch/oe/sysroots/x86_64-linux/etc
--sharedstatedir=/scratch/oe/sysroots/x86_64-linux/com
 --localstatedir=/scratch/oe/sysroots/x86_64-linux/var
  --libdir=/scratch/oe/sysroots/x86_64-linux/usr/lib
--includedir=/scratch/oe/sysroots/x86_64-linux/usr/include
 --oldincludedir=/scratch/oe/sysroots/x86_64-linux/usr/include
          --infodir=/scratch/oe/sysroots/x86_64-linux/usr/share/info
           --mandir=/scratch/oe/sysroots/x86_64-linux/usr/share/man
            --with-libtool-sysroot
--without-libssh2             --with-random=/dev/urandom
--without-libidn                 --enable-cookies --enable-crypto-auth
--enable-dict --enable-file --enable-ftp --enable-http --enable-telnet
--enable-tftp --disable-ipv6
--with-zlib=/scratch/oe/sysroots/x86_64-linux/usr/lib/../
--with-gnutls=/scratch/oe/sysroots/x86_64-linux/usr/bin --without-ssl
--disable-ares "$@"
        else
                oefatal "no configure script found"
        fi

}
>
> (btw: why do we not want gnutls in curl-native?)
>

thats a different question does not solve the problem at hand.

> Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


