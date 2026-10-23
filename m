Subject: Re: [meta-webserver][blacksail][PATCH 37/44] nginx: set CVE_STATUS for CVE-2026-95101 and CVE-2026-97629
To: openembedded-devel@lists.openembedded.org
From: "mominux" <mominux@gmail.com>
X-Originating-Location: =?UTF-8?B?R290aGVuYnVyZywgVsOkc3RyYSBHw7Z0YWxhbmQgQ291bnR5LCBTRQ==?= (83.233.54.98)
X-Originating-Platform: Linux Chrome 155
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 14:15:32 -0700
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com> <20261021092857.3585453-37-ankur.tyagi85@gmail.com>
In-Reply-To: <20261021092857.3585453-37-ankur.tyagi85@gmail.com>
Message-ID: <2794486.1792790132815517243@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="6Dym2eIdQgB2wTea7yO9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 21:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131389

--6Dym2eIdQgB2wTea7yO9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Ankur,

Thanks for the patch! I reviewed and tested it on the *Blacksail* branch. H=
ere are the test results:

*Test environment:*

*=20

Machine: *qemux86-64*

*=20

BitBake: *2.20.0*

*=20

Nginx: *1.30.6*

*=20

CVE List: *c6bdd03cb90deb06783a7890a54d1dde9d4359da*

*=20

NVD: *3c3c8ced48705560aebecd7e539f50ad7fc3654d*

*Results:*

*=20

Before applying the patch, both *CVE-2026-95101* and *CVE-2026-97629* were =
reported as Unpatched ( version-in-range ).

*=20

After applying the patch, both were correctly reported as Patched ( fixed-v=
ersion: Fixed since 1.30.6 ).

*=20

I repeated the tests with pinned CVE database revisions and confirmed that =
no other Nginx CVE classifications changed.

*=20

Nginx *1.30.6* also built successfully using bitbake nginx.

All tests passed. I haven't performed any runtime testing.

Tested by: Mohammad Abdoli <mominux@gmail.com>

Have a great weekend!

Best regards,
Mohammad

--6Dym2eIdQgB2wTea7yO9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p><span>Hi Ankur,</span></p>
<p><span>Thanks for the patch! </span><span>I reviewed and tested it on the=
 <strong>Blacksail</strong> branch. Here are the test results:</span></p>
<p><strong><span>Test environment:</span></strong></p>
<ul>
<li>
<p><span>Machine: <strong>qemux86-64</strong></span></p>
</li>
<li>
<p><span>BitBake: <strong>2.20.0</strong></span></p>
</li>
<li>
<p><span>Nginx: <strong>1.30.6</strong></span></p>
</li>
<li>
<p><span>CVE List: <strong>c6bdd03cb90deb06783a7890a54d1dde9d4359da</strong=
></span></p>
</li>
<li>
<p><span>NVD: <strong>3c3c8ced48705560aebecd7e539f50ad7fc3654d</strong></sp=
an></p>
</li>
</ul>
<p><strong><span>Results:</span></strong></p>
<ol start=3D"1">
<li>
<p><span>Before applying the patch, both <strong>CVE-2026-95101</strong> an=
d <strong>CVE-2026-97629</strong> were reported as </span><code><span>Unpat=
ched</span></code><span> (</span><code><span>version-in-range</span></code>=
<span>).</span></p>
</li>
<li>
<p><span>After applying the patch, both were correctly reported as </span><=
code><span>Patched</span></code><span> (</span><code><span>fixed-version: F=
ixed since 1.30.6</span></code><span>).</span></p>
</li>
<li>
<p><span>I repeated the tests with pinned CVE database revisions and confir=
med that no other Nginx CVE classifications changed.</span></p>
</li>
<li>
<p><span>Nginx <strong>1.30.6</strong> also built successfully using </span=
><code><span>bitbake nginx</span></code><span>.</span></p>
</li>
</ol>
<p><span>All tests passed. I haven't performed any runtime testing.</span><=
/p>
<p><span>Tested by: Mohammad Abdoli </span><span>&lt;mominux@gmail.com&gt;<=
/span></p>
<p><span>Have a great weekend!</span></p>
<p><span>Best regards,</span><br /><span>Mohammad</span></p>
</div>

--6Dym2eIdQgB2wTea7yO9--
