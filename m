Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 349E2606D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:39:15 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 0C8D068A01C; Wed, 13 Jul 2016 08:39:15 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=ALL_TRUSTED,BAYES_20,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 9478368A01B;
	Wed, 13 Jul 2016 08:39:15 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 300576740287;
	Wed, 13 Jul 2016 09:39:15 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <5785F022.8030404@mlbassoc.com>
Date: Wed, 13 Jul 2016 09:39:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
Subject: nodejs: newer npm?
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
X-List-Received-Date: Wed, 13 Jul 2016 07:39:16 -0000
X-Groupsio-MsgNum: 62144
Content-Type: multipart/mixed; boundary="------------020504010905080700030105"

--------------020504010905080700030105
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The current (at least 4.4.4) nodejs recipe also creates nodejs-npm
which is npm version 2.15.1.  I'm trying to run angularjs that needs
npm >= 3.3.x.  I've not yet tried the update to 4.4.5, so if this
fixes the issue just let me know.

What needs to be done to get a newer npm?

BTW, the current one segfaults when trying to install the
attached package file.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

--------------020504010905080700030105
Content-Type: application/json;
 name="package.json"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="package.json"

ICAgIHsKICAgICAgIm5hbWUiOiAiYW5ndWxhcjItcXVpY2tzdGFydCIsCiAgICAgICJ2ZXJzaW9u
IjogIjEuMC4wIiwKICAgICAgInNjcmlwdHMiOiB7CiAgICAgICAgInN0YXJ0IjogInRzYyAmJiBj
b25jdXJyZW50bHkgXCJucG0gcnVuIHRzYzp3XCIgXCJucG0gcnVuIGxpdGVcIiAiLAogICAgICAg
ICJsaXRlIjogImxpdGUtc2VydmVyIiwKICAgICAgICAicG9zdGluc3RhbGwiOiAidHlwaW5ncyBp
bnN0YWxsIiwKICAgICAgICAidHNjIjogInRzYyIsCiAgICAgICAgInRzYzp3IjogInRzYyAtdyIs
CiAgICAgICAgInR5cGluZ3MiOiAidHlwaW5ncyIKICAgICAgfSwKICAgICAgImxpY2Vuc2UiOiAi
SVNDIiwKICAgICAgImRlcGVuZGVuY2llcyI6IHsKICAgICAgICAiQGFuZ3VsYXIvY29tbW9uIjog
IjIuMC4wLXJjLjQiLAogICAgICAgICJAYW5ndWxhci9jb21waWxlciI6ICIyLjAuMC1yYy40IiwK
ICAgICAgICAiQGFuZ3VsYXIvY29yZSI6ICIyLjAuMC1yYy40IiwKICAgICAgICAiQGFuZ3VsYXIv
Zm9ybXMiOiAiMC4yLjAiLAogICAgICAgICJAYW5ndWxhci9odHRwIjogIjIuMC4wLXJjLjQiLAog
ICAgICAgICJAYW5ndWxhci9wbGF0Zm9ybS1icm93c2VyIjogIjIuMC4wLXJjLjQiLAogICAgICAg
ICJAYW5ndWxhci9wbGF0Zm9ybS1icm93c2VyLWR5bmFtaWMiOiAiMi4wLjAtcmMuNCIsCiAgICAg
ICAgIkBhbmd1bGFyL3JvdXRlciI6ICIzLjAuMC1iZXRhLjEiLAogICAgICAgICJAYW5ndWxhci9y
b3V0ZXItZGVwcmVjYXRlZCI6ICIyLjAuMC1yYy4yIiwKICAgICAgICAiQGFuZ3VsYXIvdXBncmFk
ZSI6ICIyLjAuMC1yYy40IiwKICAgICAgICAic3lzdGVtanMiOiAiMC4xOS4yNyIsCiAgICAgICAg
ImNvcmUtanMiOiAiXjIuNC4wIiwKICAgICAgICAicmVmbGVjdC1tZXRhZGF0YSI6ICJeMC4xLjMi
LAogICAgICAgICJyeGpzIjogIjUuMC4wLWJldGEuNiIsCiAgICAgICAgInpvbmUuanMiOiAiXjAu
Ni4xMiIsCiAgICAgICAgImFuZ3VsYXIyLWluLW1lbW9yeS13ZWItYXBpIjogIjAuMC4xNCIsCiAg
ICAgICAgImJvb3RzdHJhcCI6ICJeMy4zLjYiCiAgICAgIH0sCiAgICAgICJkZXZEZXBlbmRlbmNp
ZXMiOiB7CiAgICAgICAgImNvbmN1cnJlbnRseSI6ICJeMi4wLjAiLAogICAgICAgICJsaXRlLXNl
cnZlciI6ICJeMi4yLjAiLAogICAgICAgICJ0eXBlc2NyaXB0IjogIl4xLjguMTAiLAogICAgICAg
ICJ0eXBpbmdzIjoiXjEuMC40IgogICAgICB9CiAgICB9Cg==

--------------020504010905080700030105--
