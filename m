Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OOfek-0006zv-8i
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 01:34:58 +0200
Received: by wwf26 with SMTP id 26so73181wwf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 16:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pIASKT21d6+2uSSZ/8l/0OBzh1a8WnI3rr+wKEJnTMY=;
	b=eHJ/uaSqLkAa42qc3DQ5mzGj3PdGe5mProWd0k/kIEAyNc1FDLGVDhTOxD0/1jVtEj
	NPxBgVGbLx++Ogjp2/tIPMTODtnbjzge3ihlOjY19lzspRxsKuQiLQtIiXIL1BtyhjNr
	ttvIR2a3fRIaYSNF+2eoh7PcX0Tnx2kqAczJ8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DcviicP9X1rMmhm4nY1Nc9Z6Ho7t2neqOUqs360OUn7MaPRCHCzkUhYgbhFkYcK8rf
	i9ZGAt/kZcZBJoD/q9dNk105LtJzkagW5KeFOTbOktvWKuPm3pKKTdYwLUiQqZPUsnU5
	zIJmQT8/oZaH2cSVEjAUO8lsnl4JAnuPF++cg=
MIME-Version: 1.0
Received: by 10.216.88.21 with SMTP id z21mr4195036wee.100.1276644629506; Tue, 
	15 Jun 2010 16:30:29 -0700 (PDT)
Received: by 10.216.21.134 with HTTP; Tue, 15 Jun 2010 16:30:29 -0700 (PDT)
In-Reply-To: <4C17BCF4.30109@mentor.com>
References: <4C0D498A.4030709@mentor.com>
	<4C17BCF4.30109@mentor.com>
Date: Wed, 16 Jun 2010 01:30:29 +0200
Message-ID: <AANLkTinZ-EFiDW6IK-bRPh9JElAbnwaET56jGKnwm0cr@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Tue, 15 Jun 2010 23:34:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Tue, Jun 15, 2010 at 7:48 PM, Tom Rini <tom_rini@mentor.com> wrote:
> For the second, yes, ASSUME_PROVIDED still works. =A0For the first, I'd a=
rgue
> that doing so is a lot harder (at least without some additional
> infrastructure and reliance on other external tools) than just adding
> another early package.
>
> So, yay or nay?
>
I would say the ASSUME_PROVIDED for the native linux headers should be
mentioned in the local.conf.sample,
commented out, so that users can enable it easily (optimize the build
like Khem says).

Could you add that to the patch, or as a follow-up patch?

Acked-by: Leon Woestenberg <leon@sidebranch.com>

Regards,
--=20
Leon


