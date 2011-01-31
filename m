Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1Pjpgb-00031M-VV
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 10:04:38 +0100
Received: by qyk36 with SMTP id 36so5215011qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 01:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=xOQXgl/NSlzPlfuPqy2YmuZJErSZoZQXBDM6FZMP7s4=;
	b=X+2J36Pp3DDX9Js+uTCHBkLX+2blD4qtYcQ6j//zdgsSeCCs3dSbMN76aOZ69LvKeO
	dxjHIoegAaKY9RZ44R1QCrNhjfVLNx17EQ5JWxW8zv6QuLq3tkzhzd8XgXqrqQV2n+4V
	9fjHhJ+OY9hldKN5sMFMH66VPWOYQO6Fn2qEU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GXL43l0djrcXofC4MMELPB+4IhUTZQf49dMtKOUAOLLp9hethb+gDgHqsgwP29uo3o
	h7FjAtGJv4t1sjHtFoaByVN4o3oocgE5Q23BhqP7Mm1eHFUQB9vNRQK9QQVKh4snCwq2
	gzJ5Uwp70CAA9fWoMWxF4PepLMVTYgwL89fFY=
MIME-Version: 1.0
Received: by 10.229.217.79 with SMTP id hl15mr5448200qcb.111.1296464621511;
	Mon, 31 Jan 2011 01:03:41 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Mon, 31 Jan 2011 01:03:41 -0800 (PST)
In-Reply-To: <4D430EA4.7000504@eukrea.com>
References: <1296220547-14948-1-git-send-email-sujak.marek@gmail.com>
	<4D430EA4.7000504@eukrea.com>
Date: Mon, 31 Jan 2011 10:03:41 +0100
Message-ID: <AANLkTikVN5p1syU8aT1N3Xh18Uz=RANFCertqzz_S9fx@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] barebox: patches for barebox 2010.10 to support vmx25
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
X-List-Received-Date: Mon, 31 Jan 2011 09:04:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Eric

>
> I think you should merge this patch with the one adding the barebox 2010.10
> recipe. Or add a plain barebox 2010.10 recipe and then add
>
> +DEFAULT_PREFERENCE_vmx25 = "1"
> and
> +SRC_URI_append_vmx25 = "\
> +       file://barebox_2010.10-vmx25-20110112.patch; \
> +       "
>
> with the corresponding patch.
>
>

I just uploaded it this way. I was unable to fix it in the correct way by
git cherry-pick or git rebase. It worked at the beginning, but then i ruined
it by multiple modification and by pressing random keys on keyboard.
But because of yours and Petrs help i may succeed next time.

Thanks
Marek

