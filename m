Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OneCc-0000be-JG
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:05:42 +0200
Received: by iwn2 with SMTP id 2so3283854iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=mhqMhOdoMF/qGINT/Oj8UCeaG90BObjl9Wjg0/TTyuA=;
	b=BFNVOBNEZQ1Q9Cs0yTMAGYbMelSmVG1mo8bY2Y05hlaA4bIF+bwcFI6IamFVYvqTn6
	fIyW8eLNhDg58aerx/E+S8fz/fzpfu2krL/jur2XFxzoGGqELDuOqJswMQkFsmV7G8tT
	R4FKG+5VQb/KHL192Eo8zmGGkCpoX1cnPLch4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Ms9OiHDQoVJ0YQ/8YfzMgLbzJ10TGIaPAIJDQiXrVu8MeCd2CGbdzKCK7PSQuObcIV
	xxhF8o+CiAoBFpxWZWvGdCmeAO2zUqhoQuVwqBJnhsrzLEPKy3vugx1qNPPJ0e5P/19k
	Dz6GM9sAINNeCxOMSfFEZw9q1fTNacmO3U+jg=
Received: by 10.231.183.10 with SMTP id ce10mr7195157ibb.96.1282597482322;
	Mon, 23 Aug 2010 14:04:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Mon, 23 Aug 2010 14:04:22 -0700 (PDT)
In-Reply-To: <4C72C920.7080709@tycoelectronics.com>
References: <4C72C920.7080709@tycoelectronics.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Aug 2010 14:04:22 -0700
Message-ID: <AANLkTikfoSwTQo5jmoXLYL7sYq5DvsJAdP9P=VUQeNBF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: several recipes give a link error: libc.so, needed by libgcc_s.so, not found
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
X-List-Received-Date: Mon, 23 Aug 2010 21:05:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 23, 2010 at 12:16 PM, Jay Snyder
<jay.snyder@tycoelectronics.com> wrote:
> I am getting the following warning (I assume it is a warning, because they
> all seem to produce working executables) for several recipes (rxvt-unicode
> shown):
>
> ./rxvt-unicode-7.9-r1/temp/log.do_compile.9530:44:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/bin/ld:
> warning: libc.so, needed by
> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/lib/libgcc_s.so,
> not found (try using -rpath or -rpath-link)
>
> The following recipes all exhibit this error:

is there a problem you run into because of this warning ?


-Khem


