Return-Path: <gyurco@freemail.hu>
X-Greylist: delayed 411 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Feb 2017 16:15:08 UTC
Received: from fmx.freemail.hu (fmfe06.freemail.hu [46.107.16.199])
	by mail.openembedded.org (Postfix) with ESMTP id A47B760079
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 16:15:08 +0000 (UTC)
X-fm-smtp-source: yes
Received: from 10.6.145.199 (localhost [127.0.0.1])
	by localhost (Postfix) with ESMTP id 3vRpSv5p1DzBH0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:08:15 +0100 (CET)
From: =?UTF-8?Q?Szombathelyi_Gy=C3=B6rgy?= <gyurco@freemail.hu>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <AvSi0A.u5mfvzOvRT55.zGleTngOVAwASoCrPaYd@freemail.hu>
In-Reply-To: <CALbNGRRTvzyGpT4O0YCSmz-WvSjxVOEZCXxRE_grdV2MmvW4jQ@mail.gmail.com>
References: <20170211141745.3380-1-gyurco@freemail.hu>
	<CALbNGRQ9c=JeSRA2r5xWhpHB+fSf2JKQbjp=S4HmGJjdyJKV5A@mail.gmail.com>
	<20170220121752.GB3266@jama>
	<CALbNGRRTvzyGpT4O0YCSmz-WvSjxVOEZCXxRE_grdV2MmvW4jQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-Ip: 80.77.114.150
Date: Mon, 20 Feb 2017 17:08:15 +0100 (CET)
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedruddvgdekfecutefuodetggdotefrucfrrhhofhhilhgvmecuggftfghnshhusghstghrihgsvgdpucfhtffggffotefknfenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvffkjghfufggtghiffesrgdtregstddtudenucfhrhhomhepufiiohhmsggrthhhvghlhihipgfihipnrhhghicuoehghihurhgtohesfhhrvggvmhgrihhlrdhhuheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeduvdejrddtrddtrddupdektddrjeejrdduudegrdduhedtnecurfgrrhgrmhephhgvlhhopedutddriedrudeghedrudelledpihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepghihuhhrtghosehfrhgvvghmrghilhdrhhhupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-FM-Milter: Processed
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
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
X-List-Received-Date: Mon, 20 Feb 2017 16:15:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

If there&#39;s no solution to resolve the conflict between the internal tev=
ent and the external one, then maybe putting the libtevent-internal.h from =
the external lib to the samba tree would be a way to go.

Br,
Gy=C3=B6rgy
-------- Eredeti lev=C3=A9l --------
Felad=C3=B3: Andreas M=C3=BCller &lt;schnitzeltony&#64;googlemail.com&gt;
D=C3=A1tum: 2017 febru=C3=A1r 20 12:52:18
T=C3=A1rgy: Re: [oe] [meta-networking][PATCH v2] Samba: use built-in libtev=
ent
C=C3=ADmzett: openembedded-devel&#64;lists.openembedded.org &lt;openembedde=
d-devel&#64;lists.openembedded.org&gt;
=C2=A0
&gt; In last build I&#39;ve noticed only this new issue related to samba:
&gt;
&gt; ctdb-2.5.6: ctdb rdepends on samba, but it isn&#39;t a build dependenc=
y, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]
&gt;
&gt; Maybe this dependency was created from samba being libldb provider in
&gt; this build.
&gt;
&gt; gvfs and whole meta-gnome layers is still included in my world, maybe =
it
&gt; didn&#39;t fail because some gvfs dependency was already failing or on=
e of
&gt; samba related changes in master-next is fixing this one.
&gt;
Some background: During last weekend I prepared a series based on
master-next unblacklisting. First target is to build a xfce-image
again [1]. Last step yesterday evening should be rebasing against
latest master-next and run a test build. That failed for gvfs - so I
stopped sending stuff. Now I know why gvfs fails...

How do we proceed with this patch?

[1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2017-02

Andreas
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel&#64;lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

