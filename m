Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1J2Rj1-0000u1-VD
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2007 14:34:12 +0100
Received: by an-out-0708.google.com with SMTP id b33so48639ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2007 05:29:52 -0800 (PST)
Received: by 10.100.242.20 with SMTP id p20mr1436563anh.82.1197466192559;
	Wed, 12 Dec 2007 05:29:52 -0800 (PST)
Received: by 10.90.29.19 with HTTP; Wed, 12 Dec 2007 05:29:52 -0800 (PST)
Message-ID: <c384c5ea0712120529m10874ac8g97faeac69e60024a@mail.gmail.com>
Date: Wed, 12 Dec 2007 14:29:52 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <475EDA2B.8080109@gmx.net>
MIME-Version: 1.0
References: <475EDA2B.8080109@gmx.net>
Subject: Re: RFC: merging recipes from Jalimo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2007 13:34:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Robert,

welcome aboard. A remark from my side, although I do not use java much:


I see the compile task assumes the availability of "javac".

javac -d build -source 1.4 -sourcepath source `cat $list`;

How do you expect this to be available on the host? Will any javac
that's out there be good enough to use?

Currently, OpenEmbedded tries to rely on a defined set of host tools
to be installed, and my concern is that we now must add one (out of a
set of acceptable) java compiler to that external dependency list. If
so, we must do so carefully.

Regards,

Leon Woestenberg.


