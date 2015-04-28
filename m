Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id C407773D95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 11:01:49 +0000 (UTC)
Received: by iget9 with SMTP id t9so86140678ige.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 04:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=ObbmdU/unlUei6c2M8G3cZ/jQW6K81Hs5Yji5GayZQk=;
	b=iEi8LElvFepsez/I7tdcos/2G8mNv92rJr/JRCZw6ENBojHWtA1IZc44ATH+vtltnV
	WtFwN6j9G3iAU8Zz7ar8lo0dDSdYp6exO0v8uJLKkQd4LKHapucvK6x/vIM4xqZqkGiC
	Rn7S8Ynq/D/55VnkppsJQPuk4mCGjtVVgipgDwBxfUdNaSkufaUlvjt23C9ZM6OfD5EU
	irhC/YrcGbILPuBgf+haWMmuNWVx1a/vsPaqX5qpsc4Tes9bjZjvHGCZFlYVHDa1BYp7
	cYjtxOVZVatMZWY5WADWLB1fTGsqqdHZjQ4LOMF3uvWH65aWN2boj3xCtJy3xUX4eFPM
	Mhkw==
MIME-Version: 1.0
X-Received: by 10.107.130.165 with SMTP id m37mr19356479ioi.62.1430218910484; 
	Tue, 28 Apr 2015 04:01:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Tue, 28 Apr 2015 04:01:50 -0700 (PDT)
In-Reply-To: <1430199212-16711-1-git-send-email-b40290@freescale.com>
References: <1430199212-16711-1-git-send-email-b40290@freescale.com>
Date: Tue, 28 Apr 2015 08:01:50 -0300
X-Google-Sender-Auth: TUguoHDBObVasnt-l8EDgrCeAmE
Message-ID: <CAP9ODKrixZ2FWY1Upb3ecpji_cbbJee1ifeG2VuEYXbj6OC5Ug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][fido][PATCH] lmsensors-config: add rrdtool to lmsensors-config-cgi RDEPENDS
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
X-List-Received-Date: Tue, 28 Apr 2015 11:01:52 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 28, 2015 at 2:33 AM,  <b40290@freescale.com> wrote:
> From: Chunrong Guo <B40290@freescale.com>
>
>   QA reports a warning because lmsensors-config-cgi uses rrdtool, but does not declare runtime dependency on it.
>   Add rrdtool to RDEPENDS_${PN}-cgi.
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

Martin, I replied in the other one. The second cherry-pick is the
original patch this refers to.
-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

