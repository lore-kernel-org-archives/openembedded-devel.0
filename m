Received: from [74.125.44.157] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LwN1o-0005P9-Pz
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 22:57:17 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1022838yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 13:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rFjVrKbzp0bP0CSmodmUtIKmUKjAHR36KDryrBGIYFI=;
	b=SmUlYwKjb34jMlXn1wvYjhOVS319Gs/T+kA7UjXvaelNw2mDkFxMmw/JXzTApWbuA1
	A9w/C6/eyOHa5aZRZ6aIClsTdKiI7N48tDVLKNi2pFhaErF1hI0ZH61t0wpb1iND3Vn0
	+ZWB79aCU2vDai/Kv2umVzkaMRajyDxPdMuBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qFSPDCvjWFszrv8KBH2Ht+zMcP+sru/+PnbZTKf4dC0sdPgsqIhhC7UcGg8QJIddup
	7FxIlMCe1D9xmNtkGGdYxbFYuFXxG61EIWiz/QJrWQheKDiNT7jtkdKp/pXFG0XMdIyt
	Y69k6AkdyuUwNBVMJ9ewy5hxeqeiEI/2gq+vw=
MIME-Version: 1.0
Received: by 10.90.70.15 with SMTP id s15mr110064aga.95.1240347169712; Tue, 21 
	Apr 2009 13:52:49 -0700 (PDT)
In-Reply-To: <1238399997-6016-1-git-send-email-khimov@altell.ru>
References: <1238399997-6016-1-git-send-email-khimov@altell.ru>
Date: Tue, 21 Apr 2009 22:52:49 +0200
Message-ID: <c384c5ea0904211352o406880cbp2846efd6e0125038@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: reorder do_rootfs
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
X-List-Received-Date: Tue, 21 Apr 2009 20:57:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Roman,

On Mon, Mar 30, 2009 at 9:59 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Places do_rootfs function before do_install in image creation process.
>
> This change allows multiimage builds, when one image depends on another (before
> that second image creation raced with do_rootfs for the first one) and uses
> it for some purpose.
>
> Multiimage builds are useful in situations like creating an installer image
> with initramfs (built in OE) and an image of the target FS (also built in OE)
> or for building virtualized system images to be placed on target FS.
> ---

This looks *very* useful.

However, this might break stuff as it is intrusive. So HEADS UP everyone! :-)

Acked-by: Leon Woestenberg <leon@sidebranch.com>

Regards,
-- 
Leon


