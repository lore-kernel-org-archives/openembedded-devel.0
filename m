Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web09.14045.1614960190260422460
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=PZoQEzz3;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id 581FD2A42;
	Fri,  5 Mar 2021 11:03:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 Mar 2021 11:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=OgRuXieJ3Gp+l
	NIbkAJkyf3yf1qhIS1NCrCFJip2J5Y=; b=PZoQEzz3ymmlbxRjHSnl6ZCc/jN6v
	fGeSh+FYzfKRXVgwoMSJGxHapCpvFT66rGzVDy9yBCm1hkUccmCxfvfispG1H6oY
	gwEVHd3jXqOdPeZe60EIVtHuMLhLF6w1snGhHyo1NGVrO/To0cN6YW+0ddzM9jhV
	aLLnAfM7oiP4JD7wvUNygYOlkMYfq35E5x8QNsuK92PnfpWr+Yc9MA+GR1UCt28J
	wfAMv+KtuwAHBuw+/EMsy8h+rWZ3cU579e3JkrAynRgfUHZ++P43PEme1Co4VA7C
	jSv7+aC6q2PM5zAjOMNKbjunir8+iHGgaiakh/0oc46loIVT2fP1Gu0YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=OgRuXieJ3Gp+lNIbkAJkyf3yf1qhIS1NCrCFJip2J5Y=; b=X2Awwgdb
	KROTehccNOTMW7COxdOrr5v609UP3zXv0HDI/cZYFSLnJYG5OKwVFeUML7aaPL9Y
	rhLjZeCKAV08ei8+6ikBiBCyvRQqNiiuAaPDhXJeY8yuU5vHlGvZw/KIWdNZIzck
	ucUbIxnyBkWZoe3uVFpdiWUG2HiiduzWDa0tBkEvn92csmckEICLLmim68nL8zfJ
	1R8hZB9kvlVuXAI0sdw/vP7q0mCMI+UkZwy2w/eZduCxQ5BmrlPq2ZQCtbZRN9Aw
	b3lecKlj/V8XvQ//K3E2hwYXH32qyrAsq9MJB2lk50Dkxmmac8E8Xy9MrNRCV/rl
	LSGBCzJAQaFpMQ==
X-ME-Sender: <xms:PFZCYP6eKznmsuDumN9YKoi1Ng2TklSG2qqCQms3cJ3Qf5QKITm9pQ>
    <xme:PFZCYBkyPWxLaBeQwvXe7-lw-2he-HokPDlTY0j6TSYXG0gYFa03XejHUW5e4HkP8
    RgDcfVSj5zd_4zXgyI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfeejudefheeiffffheekue
    fgteeuueffkeefjeduudevueekuedvhfefleevheenucffohhmrghinhepphihphhirdho
    rhhgnecukfhppedutdelrddugeeirdefjedrudekvdenucevlhhushhtvghrufhiiigvpe
    dunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtgho
    mh
X-ME-Proxy: <xmx:PFZCYKWtCmhmvgnktsnNwCXcInlMGJT3HqAak7gdgX311F5Es4FfNQ>
    <xmx:PFZCYKQgcKwcoGcVAGoJWw36MQZG7cRUH88rUWS0G6ifga-JOXRmbA>
    <xmx:PFZCYHCLuD99tWINKYvPGkQAWOPvb-2yVDvQ3mhj1smNdg2C05rY7g>
    <xmx:PFZCYH2YBCjhV2tGTmdTFr5vovF1B5LdnPHSYeojBmlQe5l88ceHUw>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1E4C024005E;
	Fri,  5 Mar 2021 11:03:08 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [meta-python][PATCH v3 3/6] python3-aiohue: Integrate the hue control python module
Date: Fri,  5 Mar 2021 16:02:53 +0000
Message-Id: <20210305160256.3333334-3-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305160256.3333334-1-andrei@gherzan.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 .../recipes-devtools/python/python3-aiohue_2.2.0.bb  | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
new file mode 100644
index 000000000..a2a7363f6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Asynchronous library to control Philips Hue"
+HOMEPAGE = "https://pypi.org/project/aiohue/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+# No license file available but the license is specified in PKG-INFO and setup.py.
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
+
+SRC_URI[sha256sum] = "35696d04d6eb0328b7031ea3c0a3cfe5d83dfcf62f920522e4767d165c6bc529"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-aiohttp"
-- 
2.30.1

