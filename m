Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 88CAA6066D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2013 12:09:41 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id fb19so6167670obc.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Aug 2013 05:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=FicCo05QOsyq1tOpBWPJlbjBV9b5Gk/MAy8v4kDfUrM=;
	b=KSdPje7wfHsw8VHJ8JlGTdv/THgolraVG7emDU8kGYFjHCWM66ymIiMfdY11KxGpb2
	bWmD0zQ4boGkA2vSFYc90/XtHOwZfiglVizs3nKrNdw3AatNBUAN+UFHa9M0aebp09NG
	7RZ4Connd6wdcFfgOmCEjZZyPKWNRgicZHo5hJfvH+OLvW5+vpjDCiNNJ4LI2/6OlYMP
	G5ZLrWha6xsWQIzHBXhx3Q1tzDAnNefy7PaNllbdd3c1WzJkynrUSGlp6UV4y3Yfda9S
	pkOURzdVNGjDqsmnA37wkKuFo0vINjdmzl2Iks+m8S0wZgYckqQyLTEo84PpGZL0A+Tj
	68sg==
MIME-Version: 1.0
X-Received: by 10.182.130.131 with SMTP id oe3mr286026obb.34.1376050181806;
	Fri, 09 Aug 2013 05:09:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 9 Aug 2013 05:09:41 -0700 (PDT)
In-Reply-To: <20130809115037.GF17945@jama>
References: <1376038471-32202-1-git-send-email-Martin.Jansa@gmail.com>
	<1376038471-32202-5-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LZg4jsH2HT2joWUXcK=8Ao3xBSGKifRt0w4CMC78fLofA@mail.gmail.com>
	<20130809115037.GF17945@jama>
Date: Fri, 9 Aug 2013 09:09:41 -0300
X-Google-Sender-Auth: 1jO-HgJRi5ryEskTeF2_dHRjamI
Message-ID: <CAP9ODKqjcKOLZeWS1Vrghg9-v7-JPsPgw5LQv1E8Bm4FE7NqjA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 05/12] libwnck(3): add PACKAGECONFIG for startup-notification
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
X-List-Received-Date: Fri, 09 Aug 2013 12:09:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 9, 2013 at 8:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Aug 09, 2013 at 10:18:41AM +0100, Burton, Ross wrote:
>> On 9 August 2013 09:54, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > * it's autodetected from sysroot and couple of packages are failing
>> >   when pkg-config is trying to use libwnck*.pc without
>> >   startup-notification in sysroot
>>
>> Why not enable this by default?  People who have no need for
>> startup-notification can disable it, but this could be surprisingly
>> hard to debug if someone tries building e.g. GNOME and wonders why
>> they don't have any startup notification hints.
>
> I don't have any preference, I was just interested in making it
> explicit. I'll change it to enabled by default in branch.

I agree with Ross here as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

