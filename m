Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
X-Greylist: delayed 303 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 14 Feb 2020 23:14:42 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id BF06B61146
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 23:14:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1581722084; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: In-Reply-To: References: MIME-Version: Sender;
	bh=/g/CVUxI/CRzZqI5a8k1gtkcOZh9JtqkDJ+362Jez6k=;
	b=NQWS4n/TbXkBR6aGUE0ARN44EgkWtE8FgOJ56wexBBayMPU8kDumJ1e3FuXH86LBGNIntK2o
	Pt7buLEI9pkoyO/IP9buK+rdjd8IU583krnSRoJRtBXK7Cs/m8dAJkyIbeOV1tnzkyNRRX8X
	swA2evFyYrCGbBk5Cv2rw4KWS2U=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182])
	by mxa.mailgun.org with ESMTP id 5e47289f.7ffa0b0bcef0-smtp-out-n02;
	Fri, 14 Feb 2020 23:09:19 -0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id x2so622340ila.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 15:09:18 -0800 (PST)
X-Gm-Message-State: APjAAAXPH+ybCpZtN9pIGlfoh5CZkLQpDuiBrHgq6+X7Nli1kle87EQ5
	J60gZm3haepDszlO343iBKvZAWBWoczEMCY9orA=
X-Google-Smtp-Source: APXvYqyLYQNNqE/Zk+A9PP7zw2WxzluKwyEO0Tdr0jitj8U9rJVFyitq3RANxaVh/H50jQHafqJbUAcyUlya9OTKmTo=
X-Received: by 2002:a05:6e02:4cc:: with SMTP id
	f12mr4938102ils.90.1581721758426; 
	Fri, 14 Feb 2020 15:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20200214223751.16148-1-derek@asterius.io>
	<4316c976-5fda-d89c-70a1-729496c0e98b@gmail.com>
In-Reply-To: <4316c976-5fda-d89c-70a1-729496c0e98b@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 14 Feb 2020 17:09:07 -0600
X-Gmail-Original-Message-ID: <CADNbA1ro4XveBqg26BTKzHwffE9eqYALyPyhqWyGkx9-VBB-uA@mail.gmail.com>
Message-ID: <CADNbA1ro4XveBqg26BTKzHwffE9eqYALyPyhqWyGkx9-VBB-uA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python3-cffi: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Fri, 14 Feb 2020 23:14:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 5:02 PM Khem Raj <raj.khem@gmail.com> wrote:

> On 2/14/20 2:37 PM, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >   .../recipes-devtools/python/python-cffi.inc   | 17 -----------------
> >   .../python/python3-cffi_1.13.2.bb             | 19 ++++++++++++++++++-
> >   2 files changed, 18 insertions(+), 18 deletions(-)
> >   delete mode 100644 meta-python/recipes-devtools/python/python-cffi.inc
> >
> > diff --git a/meta-python/recipes-devtools/python/python-cffi.inc
> b/meta-python/recipes-devtools/python/python-cffi.inc
> > deleted file mode 100644
> > index a2b0c3bb0c..0000000000
> > --- a/meta-python/recipes-devtools/python/python-cffi.inc
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -SUMMARY = "Foreign Function Interface for Python calling C code"
> > -HOMEPAGE = "http://cffi.readthedocs.org/"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
> > -DEPENDS += "libffi ${PYTHON_PN}-pycparser"
> > -
> > -SRC_URI[md5sum] = "652203cf99faa254efff7fab23c2f3a2"
> > -SRC_URI[sha256sum] =
> "599a1e8ff057ac530c9ad1778293c665cb81a791421f46922d80a86473c13346"
> > -
> > -RDEPENDS_${PN}_class-target = " \
> > -    ${PYTHON_PN}-ctypes \
> > -    ${PYTHON_PN}-io \
> > -    ${PYTHON_PN}-pycparser \
> > -    ${PYTHON_PN}-shell \
> > -"
> > -
> > -BBCLASSEXTEND = "native nativesdk"
> > diff --git a/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
> b/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
> > index e888084347..6156081126 100644
> > --- a/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
> > +++ b/meta-python/recipes-devtools/python/python3-cffi_1.13.2.bb
> > @@ -1,2 +1,19 @@
> > +SUMMARY = "Foreign Function Interface for Python calling C code"
> > +HOMEPAGE = "http://cffi.readthedocs.org/"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
> > +DEPENDS += "libffi ${PYTHON_PN}-pycparser"
> > +
> > +SRC_URI[md5sum] = "652203cf99faa254efff7fab23c2f3a2"
> > +SRC_URI[sha256sum] =
> "599a1e8ff057ac530c9ad1778293c665cb81a791421f46922d80a86473c13346"
> > +
> >   inherit pypi setuptools3
> > -require python-cffi.inc
> > +
> > +RDEPENDS_${PN}_class-target = " \
> > +    ${PYTHON_PN}-ctypes \
> > +    ${PYTHON_PN}-io \
> > +    ${PYTHON_PN}-pycparser \
> > +    ${PYTHON_PN}-shell \
> > +"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> >
>
> this patch does not apply cleanly on master-next, can you rebase and
> send v2 please ?
>
No problem.  v2 sent.

