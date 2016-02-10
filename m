Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f193.google.com (mail-lb0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id DD36C60291
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:47:06 +0000 (UTC)
Received: by mail-lb0-f193.google.com with SMTP id dx9so1167008lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oxLe98IjZTIxm4qJkKNNeU+9P2dwhOkhwMSvH0CmeBI=;
	b=obwWFTBKbhboKwDSsvspkWUr3yzAjBIQ8HVPQFafaogq7TmrN0xuKb3P+FipJYJaQQ
	DI45Ylfr0IBTO0IPAn1wXe6mdHZK9aKiOzU8HfE0pjyeTbpfrnuRFx67doYHC4761fyp
	jC5GgKDddflPD+VhaFkU7TLsUKiYK0QM7vxDn5aJkBevVgMpY2MAh/Tt3SgQ/WplEYMV
	Qy+VuF8xEqvGGyEMsZuwFyWuiSUKk1YTy7ji5VJgR/IrBFVh1xyNkaWWNsmDJd7O7OmW
	kEB5GFqYbym2V/yGa2Auwv/OcBLnsgVleQEZBGL03zqHxYFJalayn2AsLcjaAyb5sfIM
	tjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=oxLe98IjZTIxm4qJkKNNeU+9P2dwhOkhwMSvH0CmeBI=;
	b=YLTsUgHDXfUL9FaUl86baEUNmTppHP+lku7YIMUkWibo/pQlpjDtJbodq/2lR94pFW
	qEKeDeY67TK1Tz8QthagUj2nLZb+nWC5ddu2zRzMLwurVSA4ZeJriSXob42H8KdafWlL
	uF1QDMGaOzhYzR8sRyIQelYsIxFOPMXBApaKs7y8YZhTrrjCy0zJSmUYM5/1NBh1quOI
	fJ6pdGnl3vjr/3YKLvWDzBzK3NnBDyUOqFtsNq6Fk7bXmBQM5A6wOyGY4N5rlzuHWXar
	+7xY5CtQKjMGDl0TxzLs+G70bcVGIFKVU+GHrIBxp80ZhRQ1lcSxuGut+A41rahdIgda
	KnBQ==
X-Gm-Message-State: AG10YOT9Z4Pyw2uoJuQfjnPPVQwUJLL2gzvwimkuQsO8dASxv1U5zgh7r0pBQSw+qaxCeDKTTxG6e4IrWxFSXw==
MIME-Version: 1.0
X-Received: by 10.112.130.41 with SMTP id ob9mr16207983lbb.81.1455126426254;
	Wed, 10 Feb 2016 09:47:06 -0800 (PST)
Received: by 10.112.20.104 with HTTP; Wed, 10 Feb 2016 09:47:06 -0800 (PST)
In-Reply-To: <1455115465-28799-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455115465-28799-1-git-send-email-maciej.borzecki@open-rnd.pl>
Date: Wed, 10 Feb 2016 19:47:06 +0200
Message-ID: <CAF6bG8e8YM=A_UF=OzPQCYMz8tXJ98veW-G+hvCL_+XqQi6JZw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] lua: bump lua.pc version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Feb 2016 17:47:07 -0000
Content-Type: text/plain; charset=UTF-8

On 10 February 2016 at 16:44, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> Lua was updated to 5.3.2, however lua.pc still has 5.2.2 listed as
> Version.

 Sorry, I have not been following this. Do we still have lua-5.2
available for packages that are not switched to lua-5.3?

 (My experience, based on single case, was that updating sw to use
lua-5.3 instead of lua-5.2 was much simpler than lua-5.1 -> lua-5.2,
but I still assume there to be fair number of packages that have had
no lua-5.3 compatible releases yet. In fact, I'm maintaining one.)


 - ML

