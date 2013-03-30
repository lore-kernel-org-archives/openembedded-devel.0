Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ULz5e-0005or-SA
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 17:57:15 +0100
Received: by mail-ob0-f174.google.com with SMTP id 16so1015711obc.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Mar 2013 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=7GOXcnrbqqVfBGP4zpbPmYVRbRqkXwmtXcrmf1j9m/o=;
	b=bIfDsuM724N/gbATzxlW5Z4WYtbvGaBm9u4sSoZuw6l25YAHbcjrBRmLCTZhAF8OPl
	eBYjFnvcmyVBGs/vF4GKnTXCyMiSDmNwJtm1NyIjrYncXwVLQinLmIAHnZCyolBrT7ef
	A/E8OY2W1414/2wWnM76x+rgPZ769oEtr4OU9uOhjIDRBPlMgl1fvv9w/nGYXfDHRRTU
	KAK5viFIKbbMw+6Xu8qcpyCQGDUr+rh0OQay1aDD7umi9zYM91u2K0QY4LGiPJ8fjdf+
	o7zkN57kihkQOMlOjC66pZcTRtrZ8rRpMRcOwluLReXbPCxhAt5lT9SfqL9R5TxCHBo6
	FXiw==
MIME-Version: 1.0
X-Received: by 10.60.25.65 with SMTP id a1mr2170210oeg.40.1364661608607; Sat,
	30 Mar 2013 09:40:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 30 Mar 2013 09:40:08 -0700 (PDT)
In-Reply-To: <5156FDFD.1030606@pseudoterminal.org>
References: <5156FDFD.1030606@pseudoterminal.org>
Date: Sat, 30 Mar 2013 13:40:08 -0300
X-Google-Sender-Auth: h-vqzqKJ4RAjC3aEpvA94b7AZes
Message-ID: <CAP9ODKr2wE7ZCr-2U=HWZ5KD0ywrmkGJtA_8f_PLsUghe_SEHw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: gst-ffmpeg configure-fix patch and yasm
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
X-List-Received-Date: Sat, 30 Mar 2013 16:57:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 30, 2013 at 12:00 PM, dv <dv@pseudoterminal.org> wrote:
> Hello,
>
> I noticed this part of the configure-fix.patch file for gst-ffmpeg 0.10.13:
>
> +  if test "x$disable_yasm" != "xyes"; then
> +    embffmpeg_configure_args="$embffmpeg_configure_args --disable-yasm"
> +  fi
>
> Shouldn't the test be:  if test "x$disable_yasm" = "xyes"  ?
> To me, it seems as if this code adds --disable-yasm if disable_yasm is not
> set to "yes", which is the complete opposite of the intended behavior.
>
> Or am I missing some detail about shell script code here?

I think you are right here. Maybe you could provide a fix for it?
--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


