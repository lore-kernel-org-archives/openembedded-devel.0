Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DA6C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 04:06:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.7476.1636517208027473692
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 20:06:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XZ/vuv/+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636517206; i=@fujitsu.com;
	bh=7fEqnxLjAPp5V7kBCS2+jAxPqcfzj4kv9HtlY6M/D80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XZ/vuv/+nT41rdiBZWlK2EXMNngQNbfyS4hFUkf846POJNQA+jseuKfqZGHeb5fzN
	 gf53r9PWZKkHgVM/LXDJgFlTF49fpCQq2k7l5pv2pYwR+SzH4w5+jR3sAGvFzz3ee7
	 JMFn6zeaXt5wQnsPDQHnlVr9bfsBExPxBVUi/3JTgWkyJTbWqrf0ID5nptmjQN3UuL
	 oQrdkmC5BofkyqFx4RTd0nMdleZI8+C8lvJG46jlNEkGRAVNzQNbNvQQt/yaOwaekK
	 Vyd+w3n5injgr5T8I+3B1J7O39SQmFezBVktO27PPnldkO2GlBHCP8wiHMnDyzu85e
	 pIcDvC4f73jRg==
Received: from [100.115.36.144] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id B3/97-16121-5554B816;
 Wed, 10 Nov 2021 04:06:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqBvq2p1
  o8G6WlMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFm6V2WgvuyFcc2vmRtYOyR6mLk4hASeMIo
  MW32L0YI5wKTxJfrm1kgnBOMEl8mPmLqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAS2Lh/2Ng9SwCqhJr7k4Hi/MKOEncP/yNEcSWEFCQmPLwPVAvBwengLNE5xpBkLAQUM
  mct61Q5YISJ2c+YYEYLyFx8MULZohWRYnZl5tZIOwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGK2TijLTM0pyEzNzdA0NDHQNDU11jc10Dc2M9BKrdBP1Ukt1y1OLS3SB3PJivdTiYr3i
  ytzknBS9vNSSTYzAME4pVlm0g7Hl8je9Q4ySHExKorwHhLoThfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwpjsB5QSLUtNTK9Iyc4AxBZOW4OBREuEtcgFK8xYXJOYWZ6ZDpE4x6nJs/7VgEbMQS1
  5+XqqUOO9xZ6AiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3LcgUnsy
  8ErhNr4COYAI64uCXdpAjShIRUlINTB5Bd46uyPBNLXjUcUw7OmTK/dMyW2/Vdp8JrLk1/Vju
  0/O7bfsZ8r+s2aiz4PKzjycjTcROPTQQe9p1uSdk7fv+eaqRO2aXRsl8VGsvufo26Nav4EtV/
  upCfneXs4UEHHQNPlOkFnAm5JZQ2KWJHcz8ATNsZnFl/14l1pCTc009w/Ce6buFTL+eL76dFP
  d1T8qBiiadZLHAc5f4kxKF7lfWtDvUs7sVOv3Q2nhk/W65jC7xC3UrZ0tbnVr2Qfr6QcupBVW
  rplxgm79EP+Do4XWrf7xfp3xSI/mUg9bJ4ArrhoSznyZ9vxa7X35XReJn3ZdPVB9+yNH9J/n6
  g8pSceer60pLZ2+7dUv2rUNVsLkSS3FGoqEWc1FxIgC7RlESagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1636517205!413239!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31896 invoked from network); 10 Nov 2021 04:06:45 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Nov 2021 04:06:45 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 06DB4100236
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:06:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EEE0610022C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 04:06:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Wed, 10 Nov 2021 04:06:23 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-graphviz: upgrade 0.17 -> 0.18
Date: Wed, 10 Nov 2021 12:06:10 +0800
Message-ID: <1636517170-63516-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636517170-63516-1-git-send-email-wangmy@fujitsu.com>
References: <1636517170-63516-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 04:06:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93899

Changelog
Version 0.18
Change of beaviour: File endings are now normalized so that all DOT source
outputs end with a final newline (Unix convention, simplifies concatenation).
This includes DOT source files written by .render(), .view(), or .save()
as well was .source generated or loaded from Source (or Source.from_file()).

Change of behaviour: Source instances created by Source.from_file() no nonger
write the content read into .source back into the
file. Use .save(skip_existing=False) before calling .render() or .view() if
you want to overwrite the file to produce the previous (less safe) behaviour.

Change of undocumented behaviour: When iterating over a Graph, Digraph,
or Source instance, the yielded lines now include a final newline ('\n').
This mimics iteration over file object lines in text mode.

When passing invalid parameters such as unknown engine, format, etc., .render()
now raises early before writing the file. Call .save() explicitly to produce
the previous (less safe) behaiour.

Add optional keyword-only encoding argument to pipe(). Returns the decoded
stdout from the rendering process (e.g. format='svg'). Delegates
encoding/decoding to subprocess in the common case (input and output encoding
are the same, e.g. default encoding='utf-8'). Used by the Jupyter notebook
integration.

Add optional keyword-only engine argument to .pipe() and .render().

Add optional keyword-only renderer and formatter arguments to Graph(),
Digraph(), Source() and Source.from_file() to set default renderers and
formatters (similar to format). Used by .pipe(), .render(), and .view() if
not given as method-argument.

Add pipe_string(), pipe_lines(), and pipe_lines_string(). Pipe input_string,
return string. Pipe input_lines incrementally, return bytes. Pipe input_lines
incrementally, return string.

Add set_default_engine() and set_default_format()

Add backend.DOT_BINARY and backend.UNFLATTEN_BINARY.

Restructure the internal class hierarchy using multiple-inheritance with
cooperative super() calling: Graph now inherits both from Dot and from Render,
and both of them inherit from Base which defines their common interface: Lines
of DOT source code that Dot generates (also Source) and rendering iterates over.
This might break some undocumented use of subclassing and require adatation

Improve test separation. Improve test coverage of running the tests with
--skip-exe.

Add pytype checking and flake8 to build workflow.

Extend type annotations.

Add https://mybinder.org config with head development environment. Add launch
badge to code repository.

Improve documentation and examples.

Add development docs.

Document release process.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-graphviz_0.17.bb => python3-graphviz_0.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.17.bb => python3-graphviz_0.18.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.17.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.18.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.17.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.18.bb
index 017a1d0fe6..200292d667 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.18.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=87cd8818b7e63c6a9c580034e80d7521"
 
-SRC_URI[sha256sum] = "ef6e2c5deb9cdcc0c7eece1d89625fd07b0f2208ea2bcb483520907ddf8b4e12"
+SRC_URI[sha256sum] = "0f04e5f939d3a839b524283d590e941892c56e75e60e0f5238c431264f490022"
 
 inherit pypi setuptools3
 
-- 
2.25.1


