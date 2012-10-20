Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TParR-0004Gi-Mn
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 17:21:13 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so947391pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=WXMhZvfICshVmUgfmJwzNLI4EGze+zK54jm4fqoP6TQ=;
	b=PB2FJmIlxIdNE98uMKD3TcIwaWyBSRrHvxXE/eihIVJ633sIoFrDs/NeuwKAY7StUl
	L5wsxqbMA9d98CCsXgLj6FA2i5pyylKUxYrgpCXSPt+0eDVpVALlntAKWu0HJtzaxCYh
	wPa9B4Os0OFozc1/sySSLKBzkGAPG57ayE4BJrfMeqHTdN7bJ7e0y4qd15cwjMlxsSLV
	h7InSlZiKP4Z2oDFBxDSMfMHxHz2MivnbLENZx81ksxtVA+glmG4VuK8syMVk1tH/GSg
	Oc+VAzd35DDTXEKtOEc0xr1ntr40956mcATz21CybYa8BnZEFBqcI3Zquz19hqqwGxEZ
	a2BA==
MIME-Version: 1.0
Received: by 10.68.135.168 with SMTP id pt8mr16343975pbb.24.1350745669610;
	Sat, 20 Oct 2012 08:07:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sat, 20 Oct 2012 08:07:49 -0700 (PDT)
In-Reply-To: <1350665204-7352-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1350665204-7352-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Sat, 20 Oct 2012 12:07:49 -0300
X-Google-Sender-Auth: Nsxf7hgJ8we7CyI7-cwDnBv7pJY
Message-ID: <CAP9ODKpbLNnHBJN1RMM=xbNUtNeQRmx4DAWxg-h+1LHedKXPCQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hddtemp: add from OE-Classic and update
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
X-List-Received-Date: Sat, 20 Oct 2012 15:21:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 19, 2012 at 1:46 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> hddtemp is unmaintained upstream so we have to do a bit of patching. All
> patches sourced from Debian/Fedora, except hddtemp-no-nls-support.patch
> which came from OE-Classic.
>
> Other improvements:
> * Install initscript
> * Make LICENSE more accurate
> * Add LIC_FILES_CHKSUM
> * inherit gettext to avoid error during configure
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

...
> diff --git a/meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff b/meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff
> new file mode 100644
> index 0000000..393b5f4
> --- /dev/null
> +++ b/meta-oe/recipes-support/hddtemp/files/hddtemp_0.3-beta15-52.diff
> @@ -0,0 +1,7545 @@
> +Megapatch from debian
> +
> +Original URL: http://ftp.debian.org/debian/pool/main/h/hddtemp/hddtemp_0.3-beta15-52.diff.gz
> +
> +Upstream-Status: unmaintained
> +
> +--- hddtemp-0.3-beta15.orig/README
> ++++ hddtemp-0.3-beta15/README

Not need; we don't use README

...
> +--- hddtemp-0.3-beta15.orig/debian/rules
> ++++ hddtemp-0.3-beta15/debian/rules
...
> +--- hddtemp-0.3-beta15.orig/debian/docs
> ++++ hddtemp-0.3-beta15/debian/docs
...
> +--- hddtemp-0.3-beta15.orig/debian/postrm
> ++++ hddtemp-0.3-beta15/debian/postrm
...
> +--- hddtemp-0.3-beta15.orig/debian/changelog
> ++++ hddtemp-0.3-beta15/debian/changelog
...
> +--- hddtemp-0.3-beta15.orig/debian/templates
> ++++ hddtemp-0.3-beta15/debian/templates
...
> +--- hddtemp-0.3-beta15.orig/debian/dirs
> ++++ hddtemp-0.3-beta15/debian/dirs
...
> +--- hddtemp-0.3-beta15.orig/debian/copyright
> ++++ hddtemp-0.3-beta15/debian/copyright
...
> +--- hddtemp-0.3-beta15.orig/debian/config
> ++++ hddtemp-0.3-beta15/debian/config
...
> +--- hddtemp-0.3-beta15.orig/debian/postinst
> ++++ hddtemp-0.3-beta15/debian/postinst
...
> +--- hddtemp-0.3-beta15.orig/debian/control
> ++++ hddtemp-0.3-beta15/debian/control
...
> +--- hddtemp-0.3-beta15.orig/debian/compat
> ++++ hddtemp-0.3-beta15/debian/compat
> +@@ -0,0 +1 @@
> ++5
> +--- hddtemp-0.3-beta15.orig/debian/README.Debian
> ++++ hddtemp-0.3-beta15/debian/README.Debian
...
> +--- hddtemp-0.3-beta15.orig/debian/po/*
> ++++ hddtemp-0.3-beta15/debian/po/*

Those are the ones I think is not worth keeping ... those are Debian
specific (except the po update but doesn't look worth to me).

In my opinion you could filterout all debian/ changes and copy the
init file (as you use it). This will reduce a lot the change size.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


