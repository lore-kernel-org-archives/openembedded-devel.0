Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E06687FA30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:38:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9VIcuZb002054
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:38:56 -0700 (PDT)
Received: from [128.224.56.218] (128.224.56.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 31 Oct 2019 11:38:52 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20191031183453.24150-1-Trevor.Gamblin@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <fbde5032-b1a0-d4a0-d9b3-bc7a6b118318@windriver.com>
Date: Thu, 31 Oct 2019 14:38:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191031183453.24150-1-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH 0/4] meta-oe: add python http2 recipes
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
X-List-Received-Date: Thu, 31 Oct 2019 18:38:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 10/31/19 2:34 PM, Trevor Gamblin wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> python3-twisted relies on various HTTP/2 modules for some optional
> functionality, but they currently aren't available in the package
> index. Specifically, twisted has nested dependencies on the
> priority, h2, hpack, and hyperframe modules either in web/http.py,
> or in web/test/test_http2.py.
> Add simple recipes to make them installable for use with twisted and
> elsewhere.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Trevor Gamblin (4):
>    python-priority: add recipe
>    python-h2: add recipe
>    python-hyperframe: add recipe
>    python-hpack: add recipe
>
>   .../recipes-connectivity/python-h2/python-h2.inc       | 10 ++++++++++
>   .../recipes-connectivity/python-h2/python-h2_3.1.1.bb  |  3 +++
>   .../recipes-connectivity/python-h2/python3-h2_3.1.1.bb |  3 +++
>   .../recipes-connectivity/python-hpack/python-hpack.inc | 10 ++++++++++
>   .../python-hpack/python-hpack_3.0.0.bb                 |  3 +++
>   .../python-hpack/python3-hpack_3.0.0.bb                |  3 +++
>   .../python-hyperframe/python-hyperframe.inc            | 10 ++++++++++
>   .../python-hyperframe/python-hyperframe_5.2.0.bb       |  3 +++
>   .../python-hyperframe/python3-hyperframe_5.2.0.bb      |  3 +++
>   .../python-priority/python-priority.inc                | 10 ++++++++++
>   .../python-priority/python-priority_1.3.0.bb           |  3 +++
>   .../python-priority/python3-priority_1.3.0.bb          |  3 +++
>   12 files changed, 64 insertions(+)
>   create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2.inc
>   create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
>   create mode 100644 meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
>   create mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack.inc
>   create mode 100644 meta-python/recipes-connectivity/python-hpack/python-hpack_3.0.0.bb
>   create mode 100644 meta-python/recipes-connectivity/python-hpack/python3-hpack_3.0.0.bb
>   create mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe.inc
>   create mode 100644 meta-python/recipes-connectivity/python-hyperframe/python-hyperframe_5.2.0.bb
>   create mode 100644 meta-python/recipes-connectivity/python-hyperframe/python3-hyperframe_5.2.0.bb
>   create mode 100644 meta-python/recipes-connectivity/python-priority/python-priority.inc
>   create mode 100644 meta-python/recipes-connectivity/python-priority/python-priority_1.3.0.bb
>   create mode 100644 meta-python/recipes-connectivity/python-priority/python3-priority_1.3.0.bb
>
Oops, wrong label. Resending...

