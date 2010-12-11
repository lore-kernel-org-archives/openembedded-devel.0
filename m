Received: from mail-iw0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRLQM-00077w-6G
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 10:07:27 +0100
Received: by iwn40 with SMTP id 40so6469020iwn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 01:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=gvR7G7AIDGoL106V+/FL+A2Mo/QaX9zhW0vgjRgVKX8=;
	b=VOOVX8yzcb9smOgKYU0y2rnSdAjjHB/S1IqJ5LbDQEjjLEp7ID0Ez+I3R7ZBg4v7jU
	1GCDZIQ37e70RLJAssR7y+FCkI2iENXJ9o6Dp7RXiDUrjCC0lBxS1iPLUSLeBkNgoxFC
	tZpGZqqImC9xLz59zkarB+TNx3JkZOeXCn+FU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=fG3zxWYvR/xul2OkH8nmAIuTdy+8Y9S9aRx83yEXuQqvuwCexnbzQkJ4zOuy9gsh3Y
	TjXVICJBY8QexNGgTMvuw5n8Pp1iSn4/YmnNQlwsRAWVgJOVu58XTpnVh61C2yPRPYdf
	tqqlFi50d3SSxkqS3Cj5ltYDHBGB8h0U0b5SE=
Received: by 10.42.167.136 with SMTP id s8mr1289933icy.8.1292058352691;
	Sat, 11 Dec 2010 01:05:52 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 34sm3534846ibi.20.2010.12.11.01.05.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Dec 2010 01:05:51 -0800 (PST)
Date: Sat, 11 Dec 2010 01:05:51 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101211090551.GB8894@gmail.com>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D34C@DEMCHP99E35MSX.ww902.siemens.net>
	<09D9BE2AC4AA764DABAA8C91E48D819ED3B1D5D0@DEMCHP99E35MSX.ww902.siemens.net>
	<4CF38257.3040406@eukrea.com>
	<09D9BE2AC4AA764DABAA8C91E48D819ED3B1D61C@DEMCHP99E35MSX.ww902.siemens.net>
MIME-Version: 1.0
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D61C@DEMCHP99E35MSX.ww902.siemens.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.173
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qte: fixed do_configure() for powercpc
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
X-List-Received-Date: Sat, 11 Dec 2010 09:07:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (29/11/10 12:35), Aeschbacher, Fabrice wrote:
> Hi,
> 
> Here is my 'git format-patch' again, after having run 'git rebase master'

still I have to apply this patch manually

> 
> With kind regards,
>   Fabrice
> 
> 
> Signed-off-by: Aeschbacher <fabrice.aeschbacher@siemens.com>
> ---
>  recipes/qte/qte-common_2.3.10.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/qte/qte-common_2.3.10.inc b/recipes/qte/qte-common_2.3.10.inc
> index 18811c7..2eed76d 100644
> --- a/recipes/qte/qte-common_2.3.10.inc
> +++ b/recipes/qte/qte-common_2.3.10.inc
> @@ -109,7 +109,7 @@ export SYSCONF_LFLAGS = "${LDFLAGS} -lts"
>  export SYSCONF_MOC = "${STAGING_BINDIR_NATIVE}/moc"
>  export SYSCONF_UIC = "${STAGING_BINDIR_NATIVE}/uic"
>  
> -# generate uclibc and eabi configurations
> +# generate uclibc, eabi and powerpc configurations
>  do_configure() {
>         for f in ${S}/configs/linux-*-g++-shared; do
>                 sed -e 's,-linux-,-linux-uclibc-,g' < $f \
> @@ -119,6 +119,7 @@ do_configure() {
>                 sed -e 's,-linux-,-linux-uclibceabi-,g' < $f \
>                         > `dirname $f`/`basename $f | sed -e 's,linux-,linux-uclibceabi-,'`
>         done
> +       sed -e 's/arm/powerpc/'  ${S}/configs/linux-arm-g++-shared > ${S}/configs/linux-powerpc-g++-shared
>         echo yes | ./configure ${EXTRA_OECONF} || die "Configuring qte failed. EXTRA_OECONF was ${EXTRA_OECONF}"
>  }
>  
> -- 
> 1.5.6.5
> 
> 
> 
> > -----Ursprüngliche Nachricht-----
> > Von: openembedded-devel-bounces@lists.openembedded.org 
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] Im 
> > Auftrag von Eric Bénard
> > Gesendet: Montag, 29. November 2010 11:37
> > An: openembedded-devel@lists.openembedded.org
> > Betreff: Re: [oe] [PATCH] qte: fixed do_configure() for powercpc
> > 
> > Hi,
> > 
> > On 29/11/2010 11:19, Aeschbacher, Fabrice wrote:
> > > Is this patch likely to be accepted and commited soon in 
> > branch release-2010.12, or should I overlay?
> > >
> > the patch doesn't apply can you please rebase it against master ?
> > 
> > Applying: qte: fixed do_configure() for powercpc
> > error: patch failed: recipes/qte/qte-common_2.3.10.inc:109
> > error: recipes/qte/qte-common_2.3.10.inc: patch does not apply
> > Patch failed at 0001 qte: fixed do_configure() for powercpc
> > 
> > Eric
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


