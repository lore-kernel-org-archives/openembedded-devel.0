Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8F86065C88
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 21:16:46 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 10so7988881ykt.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Dec 2014 13:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=UYr0hL9cdTGawqINFqAiSI06BD9jk9dhbUXqMdh0wE0=;
	b=kLmZ58dhHSWtl3LQbzKkQcWr06/X+vEHA0ZIiEKS+ewCuzJGxHDtFeyHSORepOrK3e
	Ba4Phr+1Rwx8WmvUvTq/WNH4cLHsyC5LuUrdVEXTsp3InvOC/aa2+Y8/Iw9ylvpadQJ6
	MzgCaR4V5MqKkbKTTU6JFRmFbWVllBtE6v2aIXuxUVXDEtH2vtZPw1jmXfW4kKNvkkzV
	jFixQ2i4j/4d+mndnayljAXqHgCfZFkN6cd/FgCyZXBAdFV0A2pXAgrhIHdwk2//PMOz
	0ndZ0QA9opW73VksIVbD/Z6vqdewLrO2PTXHu5UO95zrfTMjURkvkJq9InFzp4PPT2de
	TRNQ==
MIME-Version: 1.0
X-Received: by 10.170.47.210 with SMTP id 201mr50052422ykp.30.1420060606887;
	Wed, 31 Dec 2014 13:16:46 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Wed, 31 Dec 2014 13:16:46 -0800 (PST)
In-Reply-To: <5940D1D9F240BA44AEF939055CF1358D04A3DFE8@xmb-aln-x12.cisco.com>
References: <1420013305-1133-1-git-send-email-jbriance@cisco.com>
	<5940D1D9F240BA44AEF939055CF1358D04A3DFE8@xmb-aln-x12.cisco.com>
Date: Wed, 31 Dec 2014 19:16:46 -0200
X-Google-Sender-Auth: QTvTzKzzgkzuCUCZZEX7dfmNCNo
Message-ID: <CAP9ODKqQ1H_yeoOxoA5Y-WtSi8u-9f4sgdvRJiQocxudbQj6RA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: Add gcc to QMAKE_COMPILER variable.
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
X-List-Received-Date: Wed, 31 Dec 2014 21:16:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 31, 2014 at 6:26 AM, Julien Brianceau (jbriance)
<jbriance@cisco.com> wrote:
> According to mkspecs/features/spec_post.prf, QMAKE_COMPILER variable should at least contain gcc for linux-oe-g++ platform.
>
> This patch fixes a crash issue in QtWebKit introduced in v5.4.0 by:
> https://qt.gitorious.org/qt/qtwebkit/commit/34d4628b981add039a9a349723cbdff1dadca144

It is lacking the signed-off-by line.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

