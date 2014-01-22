Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0F46860017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:23:56 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id va2so466161obc.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=VG1LQy9TG73dPczCyozyshc8uGYUDUHo+uxIPqxCP/w=;
	b=ip8qcckEU8hlD6rryFHpp4Ci55CNtyH7FCI21xDzG9yLv1ZNfBXT2t3H9RYsT2uKkR
	V9zVsVF7ixGIOHKVmxzbCx58VQkwGEFvgsRWCxr2SklR8zQW5N3Y8NG95CNRmV68jgA9
	TlE+kAEmCPDDurq4ujbaMXM5xevjW3zZurQPC82Et1TDZOtt8nxcl7qv+2HZIygM+Fgy
	Ow7Pt22A0Jq77wuRK6uXbVwG376QRWQ/cTW93Wzpc45HmQ1p0D5TQqDzXLydi0ED/wK4
	oTVAY6JAIgPbHEPQOqEOb5y19a77uG5BQPPOJ1YfJim1NKn72eANGSu6JPksCCKNVtn1
	Cp5g==
MIME-Version: 1.0
X-Received: by 10.60.135.130 with SMTP id ps2mr1520508oeb.46.1390400638031;
	Wed, 22 Jan 2014 06:23:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:23:57 -0800 (PST)
In-Reply-To: <1390230519-21756-1-git-send-email-obi@opendreambox.org>
References: <1390230519-21756-1-git-send-email-obi@opendreambox.org>
Date: Wed, 22 Jan 2014 12:23:57 -0200
X-Google-Sender-Auth: xz3miQjE5L_jx4m6vbHErjs2cZs
Message-ID: <CAP9ODKqebrBf4vV9oBFFcHYGbyWZV5F6OO6uJMDwBEcxD+EW+g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	"Felipe F. Tonello" <ftonello@cercacor.com>
Subject: Re: [meta-oe][PATCH] libconnman-qt: update to 1.0.46, add recipe for qte
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 14:23:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 20, 2014 at 1:08 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * Use _git version suffix, because it really is a Git recipe.
> * Create an inc file to be shared between qt4x11 and qt4e.
> * Use CONFIG+=notests, because CONFIG+=notest has no effect now.
> * Reorder some variables according to style guide.
> * Remove unneeded PROVIDES for ${PN}-plugin, which is already listed
>   in PACKAGES.
> * Hardcode branch to master, because no other branch exists upstream.
> * Simplify do_install.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

Felipe, as I know you use this, may you take a second look here?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

