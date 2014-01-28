Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 23D636E8A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 21:49:45 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wn1so1074236obc.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 13:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=jiI/OxWT0+Xof2lrEkEJqojKXD646l+updJH1IDuoCQ=;
	b=UVP5G7qi9PVO9z6H8yF+k6zOYzEu18CJwgXHRP0rGgx+Ad6y5/JuzMIGhvCDd0AYCU
	yUUTYQK+sAJ3S4kVkNwNKYTT7aZchwHMP7bLxebllCos2MReMpA1vhtAF/OKAygufIsc
	EEpMqqDAzn00vhi0A1CFKxBwiFSDF7HuLpHozAF/QP80FydZaNfaEYTdo/ZmQ06ywQJx
	syy2CLsX49bMRhRDV1lXlNSaNDAUFPLfd1ToppNEBAE6Q62vz9zEYzuf9HVdQ8ZOZYsB
	BtvB9SA69smDt3knzY6Jc05PHYC41wOylhombtlK/hyZAxBHKAy2VSwFnM7RjnxXgaNE
	+GKg==
MIME-Version: 1.0
X-Received: by 10.182.161.1 with SMTP id xo1mr2925526obb.19.1390945785784;
	Tue, 28 Jan 2014 13:49:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 28 Jan 2014 13:49:45 -0800 (PST)
In-Reply-To: <1390923283-17138-1-git-send-email-obi@opendreambox.org>
References: <20140128143329.GK3718@jama>
	<1390923283-17138-1-git-send-email-obi@opendreambox.org>
Date: Tue, 28 Jan 2014 19:49:45 -0200
X-Google-Sender-Auth: 3S7SG2FZ23JQelQOvF3n3-zEOmg
Message-ID: <CAP9ODKrY41cH87A=uP=XNYSPWfp4ty0UJ1WgKetKx0w2LvOAzA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libconnman-qt: fix linking and packaging with Qt4/Embedded
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
X-List-Received-Date: Tue, 28 Jan 2014 21:49:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 28, 2014 at 1:34 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> * Don't overwrite EXTRA_QMAKEVARS_PRE, because qt4e.bbclass uses
>   it to pass on QT_LIBINFX.
> * Generalize QT_IMPORTS_DIR to make it valid for qte.
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

