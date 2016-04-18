Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7E41760616
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 18:27:16 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 184so83734798pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ALgJNMCEF0cAeR8NLKpdeflGNZMbvwe9IdLgvB2Se2Q=;
	b=XvisC9fZOKQudRytPnow+TU9JiKej9ocnL0Pg5gByjA1VLpX7J49W4cC1RxzF6uxS3
	OD/IBXIgAngMxClTfvX9B68cXb/BDNGgde09/92j0HWCMpIzVGeEWrrBszZHhj4x7DIb
	pYr7kDrQSsJ+2xeGCybdhZ0hyfcglFsgpibb71O3PESXkBqX+ei+hINCZnY+W7urs01u
	MI6EJW8rJFfWmIpKO4Fv1l1m677vfze0JSuF4jxUXNdPoIfp7F8zmwupGm0x0uo3CG5a
	/2jyMADq6gaPqnZ+Ep3tJY8dfuyhgrHGghraxht3u45pZpUxoKbwkGJjVBRnLBQCiVtY
	Qmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ALgJNMCEF0cAeR8NLKpdeflGNZMbvwe9IdLgvB2Se2Q=;
	b=DpM2o93JNfnoNOTC2BlSbkZIilONJHQVTkOYe1oaUBygM3xqRqIot6DqD3ErYGxxBC
	fHU3baKpaWgNqcRLFSLtvG92r+p+swRuIpbLMyew2lMb6ngxo+RlXTd0UlwTzhQHlReA
	UcCbdosJkU4Njff3+2E2yLCOwvVi0M25ZrQ7LZmQCpNoPUzM82NxLFPIKN45FTWHFmnD
	mn2ySUtdpKXcpIcGXGWjKQ+3hPi60B8UXmR+yNzgjxL6iKOL4o3CbLSIrL+Mo/A7DtL5
	eIOkU0y6ZokS00eihp4Safk3RKN3vUDXvqETmX74JSkccfeMdOw10qZtQw0LhuCNFGt9
	YYYg==
X-Gm-Message-State: AOPr4FVzEPnmLVt5MAxNwx7PfewgILDEkDqdMsJj+Xy6Ma7xVhKYGpYHbxP5hy96XUb/Cg==
X-Received: by 10.98.65.203 with SMTP id g72mr52081902pfd.138.1461004037170;
	Mon, 18 Apr 2016 11:27:17 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	s63sm29542442pfb.71.2016.04.18.11.27.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 11:27:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 11:26:59 -0700
Message-Id: <1461004019-20893-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1461004019-20893-1-git-send-email-akuster808@gmail.com>
References: <1461004019-20893-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] flite: fix license issue.
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
X-List-Received-Date: Mon, 18 Apr 2016 18:27:17 -0000

copy license from http://www.speech.cs.cmu.edu/flite/ and include text

WARNING: flite-alsa: No generic license file exists for: flite in any provider

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/licenses/flite | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/licenses/flite

diff --git a/meta-oe/licenses/flite b/meta-oe/licenses/flite
new file mode 100644
index 0000000..51e67fd
--- /dev/null
+++ b/meta-oe/licenses/flite
@@ -0,0 +1,32 @@
+/*************************************************************************/
+/*                                                                       */
+/*                  Language Technologies Institute                      */
+/*                     Carnegie Mellon University                        */
+/*                      Copyright (c) 1999-2009                          */
+/*                        All Rights Reserved.                           */
+/*                                                                       */
+/*  Permission is hereby granted, free of charge, to use and distribute  */
+/*  this software and its documentation without restriction, including   */
+/*  without limitation the rights to use, copy, modify, merge, publish,  */
+/*  distribute, sublicense, and/or sell copies of this work, and to      */
+/*  permit persons to whom this work is furnished to do so, subject to   */
+/*  the following conditions:                                            */
+/*   1. The code must retain the above copyright notice, this list of    */
+/*      conditions and the following disclaimer.                         */
+/*   2. Any modifications must be clearly marked as such.                */
+/*   3. Original authors' names are not deleted.                         */
+/*   4. The authors' names are not used to endorse or promote products   */
+/*      derived from this software without specific prior written        */
+/*      permission.                                                      */
+/*                                                                       */
+/*  CARNEGIE MELLON UNIVERSITY AND THE CONTRIBUTORS TO THIS WORK         */
+/*  DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING      */
+/*  ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT   */
+/*  SHALL CARNEGIE MELLON UNIVERSITY NOR THE CONTRIBUTORS BE LIABLE      */
+/*  FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES    */
+/*  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN   */
+/*  AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,          */
+/*  ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF       */
+/*  THIS SOFTWARE.                                                       */
+/*                                                                       */
+/*************************************************************************/
-- 
2.3.5


