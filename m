Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 96DBE606E8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 20:26:50 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id q200so9204673ykb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2015 12:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CrJ4Nx4/lk1bxxC3LZ++697RnpMoIHN3i6/58OKxV/Y=;
	b=CqaadaXl5E3lfOwwME2NV7vSO7Dzgt6qPwjgYNeqeMyZyJPXB+kqUobOxBWI2kF1aD
	A8FnqW5yQNkZnOd055py0OUfstYhTeW0yBpd1XEkVNNYKKTyWZvw5RI/sgJ42IojUIId
	kN+BDlhxrOHkKZ3zIi24vSOMDKoADvKWZDWrUDFWpWUZvwSJMx2iuwr4xyqUbpK8d2Uf
	2dE2GkYrP9F1oRjXxSCzRzT8AOCCeFedFd9fnhOXZg6uEkunB9dOpGPXOZ1pGGwOXWRG
	lmUPNRPfq3hNQ/BUOY/ZIGo/m+qZlOE5v6Wx6NcvmOnYzMgCldRAYVQ/5SwfzAGXnPCW
	Z4XQ==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr14425559yhb.136.1424032011405;
	Sun, 15 Feb 2015 12:26:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Sun, 15 Feb 2015 12:26:51 -0800 (PST)
In-Reply-To: <20150215131404.GB2297@jama>
References: <1423649212-5156-1-git-send-email-pau.espin@aweurope.be>
	<20150215131404.GB2297@jama>
Date: Sun, 15 Feb 2015 18:26:51 -0200
X-Google-Sender-Auth: xx9Ml6HPVtF021kFJjl7zLhklas
Message-ID: <CAP9ODKrkHJqpa750RUf_CBJLS=xNzKfbqHgbV2Xm_e==wf6gMA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Pau Espin Pedrol <pau.espin@essensium.com>
Subject: Re: [meta-qt5][PATCH] qtmultimedia: Enable building of package qtmultimedia-examples
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
X-List-Received-Date: Sun, 15 Feb 2015 20:26:55 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 15, 2015 at 11:14 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Feb 11, 2015 at 11:06:52AM +0100, Pau Espin Pedrol wrote:
>> From: Pau Espin Pedrol <pau.espin@essensium.com>
>>
>> Signed-off-by: Pau Espin Pedrol <pau.espin@essensium.com>
>> ---
>>  recipes-qt/qt5/qtmultimedia.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
>> index 427f688..de1839f 100644
>> --- a/recipes-qt/qt5/qtmultimedia.inc
>> +++ b/recipes-qt/qt5/qtmultimedia.inc
>> @@ -14,6 +14,9 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'pulseaudio', '', 'CON
>>  EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'openal', 'CONFIG+=OE_OPENAL_ENABLED', '', d)}"
>>  EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
>>
>> +QT_MULTIMEDIA_BUILD_PARTS ?= "examples"
>> +EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=${QT_MULTIMEDIA_BUILD_PARTS}"
>> +
>>  SRC_URI += "\
>>      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
>>      file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch \
>
> With this applied I've seen new QA error:
> ERROR: QA Issue: qtmultimedia-examples-dbg: found library in wrong location: /usr/share/qt5/examples/multimedia/spectrum/.debug/libfftreal.so.1.0.0
> qtmultimedia-examples: found library in wrong location: /usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1.0
> qtmultimedia-examples: found library in wrong location: /usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1
> qtmultimedia-examples: found library in wrong location: /usr/share/qt5/examples/multimedia/spectrum/libfftreal.so.1.0.0
> qtmultimedia-examples-dev: found library in wrong location: /usr/share/qt5/examples/multimedia/spectrum/libfftreal.so [libdir]
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa

I got the same warnings.

One thing I am concerned about is /why/ you didn't have the examples
built by default and I do?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

