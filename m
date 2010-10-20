Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P8RSv-0001AC-TB
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 07:43:59 +0200
Received: by pwi8 with SMTP id 8so316989pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 22:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=H24sxvdZlqX3pxpdnlLeVzQO05NyrjHvnd0klNizKv8=;
	b=GoNv/aMKqj6cc7WwGiG3tvy7ISqf4tXP2JkyQvoCLaS8EiklB/3znI2mjb3LyGyB2V
	6ccesv4Y3pqAXbYG2y7qQGFiMO8fYkFo+hDazqgtAvxjGV+d6M45cjeC5C5yMFA6ajyE
	yJsoU9pTLsjX+6D2E8YrDSKdxD2KahdASXbRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=p+rEW0Ya1aBYIXr0uhFSMy1N2pYJVYmHQJ864EoyC2R2zq3Ixrn1wNZtnizLf+XiJp
	PgjGP4AEmQ1PQXl8pchh1wpZQr8LXVKtamX2W42OB0i6VmFx/MPAntCCmyB2oxclwu3T
	8CE7Sol9K0KYCVKmFF9NGpEirN6e8Asc5juJE=
Received: by 10.142.245.21 with SMTP id s21mr5479994wfh.329.1287553388228;
	Tue, 19 Oct 2010 22:43:08 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	x35sm18971169wfd.13.2010.10.19.22.43.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 22:43:07 -0700 (PDT)
Message-ID: <4CBE8166.5050104@gmail.com>
Date: Wed, 20 Oct 2010 16:13:02 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBE2B7A.4040601@gmail.com>
In-Reply-To: <4CBE2B7A.4040601@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: nspr-4.7.1: race condition causing occasional build failure
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
X-List-Received-Date: Wed, 20 Oct 2010 05:44:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/20/2010 10:06 AM, Graham Gower wrote:
> The failure looks like this:
> 
> make[3]: Entering directory `/mnt/oe/tmp/work/mipsel-oe-linux/nspr-4.7.1-r1/nspr-4.7.1/mozilla/nsprpub/pr/include/md'
> ../../../config/./nsinstall -R -m 444 ./_aix32.cfg ./_aix64.cfg ./_beos.cfg ./_bsdi.cfg ./_darwin.cfg ./_dgux.cfg ./_freebsd.cfg ./_hpux32.cfg ./_hpux64.cfg ./_irix32.cfg ./_irix64.cfg ./_linux.cfg ./_ncr.cfg ./_nec.cfg ./_netbsd.cfg ./_nextstep.cfg ./_nto.cfg ./_openbsd.cfg ./_openvms.cfg ./_os2.cfg ./_osf1.cfg ./_qnx.cfg ./_reliantunix.cfg ./_riscos.cfg ./_scoos.cfg ./_solaris.cfg ./_sony.cfg ./_sunos4.cfg ./_unixware.cfg ./_unixware7.cfg ./_win16.cfg ./_win95.cfg ./_winnt.cfg ../../../dist/include/nspr/md
> ../../../config/./nsinstall: ../../../config/./nsinstall: cannot execute binary file
> make[3]: *** [export] Error 126
> 

Even with PARALLEL_MAKE and BB_NUMBER_THREADS commented out in my local.conf
I can reproduce the failure within a few minutes using the following loop.

while :; do
	./bitbake.sh -b openembedded/recipes/mozilla/nspr_4.7.1.bb -c clean
	./bitbake.sh -b openembedded/recipes/mozilla/nspr_4.7.1.bb -c compile || break
done


