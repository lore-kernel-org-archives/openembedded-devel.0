Return-Path: <urs@bytesatwork.ch>
Received: from bytesatwork.ch (bytesatwork.ch [91.135.72.15])
	by mail.openembedded.org (Postfix) with ESMTP id D59B96F19E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 07:50:53 +0000 (UTC)
Received: from [192.168.2.20] (8-89.61-188.cust.bluewin.ch [188.61.89.8])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: urs)
	by bytesatwork.ch (Postfix) with ESMTPSA id EDE8BCC18E3A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 08:42:13 +0100 (CET)
Message-ID: <1392882657.29514.3.camel@mars.bytesatwork.ch>
From: Urs =?ISO-8859-1?Q?F=E4ssler?= <urs@bytesatwork.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2014 08:50:57 +0100
In-Reply-To: <CAP9ODKo96otJprbv_3OboT4WpiKUdXJdyKdkt6ppJK3aC+kzDg@mail.gmail.com>
References: <1392780156-11122-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKo96otJprbv_3OboT4WpiKUdXJdyKdkt6ppJK3aC+kzDg@mail.gmail.com>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Subject: Re: [meta-qt5][PATCH] qmake5_base.bbclass: Use Qt version specific paths
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
X-List-Received-Date: Thu, 20 Feb 2014 07:50:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mit, 2014-02-19 at 16:11 -0300, Otavio Salvador wrote:
> On Wed, Feb 19, 2014 at 12:22 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > When looking for Qt5 components and files we ought to use the Qt5
> > specific path. In case the distribution wants to have a flat tree it
> > can set QT_DIR_NAME and it will still works as expected.
> >
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> > I have built two image and the SDK from scratch using this with no
> > issues. Could someone also give this a try?
> 
> Today I rebuilt 5.2.1 image and SDK in two build machines (one Debian
> Sid and another Debian 7.4 based) and both succeed.
> 
> Did someone try this one?
> 

I successfully built Qt 5.2.1 (from the 5.2.1 repository, not the above
patch) for ARM on Debian 7.4. I had some problems with cmake stuff, but
not sure if this has to do with my configuration.


-- 
bytes at work
Konradstrasse 15
CH-8400 Winterthur
Switzerland

phone: +41 52 213 79 79
fax:   +41 52 203 27 13



