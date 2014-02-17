Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id EA5F96E6F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 21:28:10 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id wn1so17420544obc.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 13:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=dgX/CK8ptqEN8ZG4bmFk8xO73GEGNTqEFMQpJvgUdQg=;
	b=mXK6oyuzbyXwC7X+qz8k/DClW44RoPMJdU/+r4zQrKDMcNeEPrPDfkBQCtqAb0hK6h
	hboBQjjuuEGyEKyBqtmN5tjoBFUPLqT6NKOgxU3xzbmHFCus90Ucq9pcSFshETh/kqrF
	oqTa+1u1a8HjSVuq3x7zgKGRp0BSCTH7mymdalCUBxavPp42Q33GrPTcIhT8HUb52KI+
	98UV2rn61SxGsxZe1jElgTiCxoLE1rwZAKphenGOOnbLFiipquk4gK+GHFEKojCzsHd1
	M83hNdAO6f30UJNwDSxx+EbiqSf9wtcrkrEfKn1REWqp9ZpL9gpP620azj/GN6c+00ge
	HyCg==
X-Gm-Message-State: ALoCoQkWfK+wW3sS9snopUxDZ92i3nGz6xdzUsXBsMzAKkQxS++h1l3MlYD0gmXfe+ifGyV8o1aQ
X-Received: by 10.60.246.164 with SMTP id xx4mr22953399oec.25.1392672491081;
	Mon, 17 Feb 2014 13:28:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Mon, 17 Feb 2014 13:27:51 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 17 Feb 2014 14:27:51 -0700
Message-ID: <CAP71Wjy4dxnDZFb3x_5zPg5HV-VOakeYtFz+8o0h2xk08R1=zQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Andre McCurdy <andre.mccurdy@entropic.com>
Subject: [meta-qt5] why does Qt5 build with ARM_INSTRUCTION_SET = "arm"
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
X-List-Received-Date: Mon, 17 Feb 2014 21:28:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

does anybody know why in Qt5/qtbase.inc, we have:

ARM_INSTRUCTION_SET = "arm"

Could it be an a low hanging fruit from the past? e.g. before
https://bugreports.qt-project.org/browse/QTBUG-16402 or
https://qt.gitorious.org/qt/qtbase/commit/a3bd9d4c0f3d9e80dbe35bd88649b245dca5f410?

as a matter of fact, for our project Qt5 (and QtWebkit) are building
(and working fine) when built with Thumb2, outside of OE. Also using
ARM instruction set instead of Thumb2 enforces Webkit to use the ARM
version of the javascript JIT, while the Thumb2 JIT engine seems to
work a lot better in our testing...

cheers

nico

