Return-Path: <prvs=094b901df=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 35C7A71B78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 08:28:23 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HWAwAPfwhY/0oKEKxcHQEFAQsBgz4BA?=
	=?us-ascii?q?QEBAXQqUweNLZZ8lD2CCBwNhXgCgkIUAQIBAQEBAQEBA4EHhGIBAQEDAQECLwF?=
	=?us-ascii?q?WCw0LLigvBg0IAohGFsNOAQEIJ4Y9gX2CWIUThRMFmg6BZ4RDhVeGSIcvF4V5j?=
	=?us-ascii?q?H+EAB6BAIUIcAGHQIEAAQEB?=
X-IPAS-Result: =?us-ascii?q?A2HWAwAPfwhY/0oKEKxcHQEFAQsBgz4BAQEBAXQqUweNLZZ?=
	=?us-ascii?q?8lD2CCBwNhXgCgkIUAQIBAQEBAQEBA4EHhGIBAQEDAQECLwFWCw0LLigvBg0IA?=
	=?us-ascii?q?ohGFsNOAQEIJ4Y9gX2CWIUThRMFmg6BZ4RDhVeGSIcvF4V5jH+EAB6BAIUIcAG?=
	=?us-ascii?q?HQIEAAQEB?=
X-IronPort-AV: E=Sophos;i="5.31,518,1473112800"; 
   d="scan'208";a="551961"
To: <openembedded-devel@lists.openembedded.org>
References: <CAOwy=PPr-9vu=kJTSR8qJk6_31jjP1FrUO3XvO_JrSDb2-n-fQ@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <ed8fd104-a3c9-e722-170c-241b089f200c@skidata.com>
Date: Thu, 20 Oct 2016 10:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAOwy=PPr-9vu=kJTSR8qJk6_31jjP1FrUO3XvO_JrSDb2-n-fQ@mail.gmail.com>
X-Originating-IP: [172.16.60.30]
X-ClientProxiedBy: sdex1srv.skidata.net (172.16.10.92) To sdex1srv.skidata.net
	(172.16.10.92)
Subject: Re: [meta-java] fails to fetch icedtea
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
X-List-Received-Date: Thu, 20 Oct 2016 08:28:24 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 10/20/2016 08:36 AM, Joël Guittet wrote:
> Hi,
> 
> I'm building an image with OpenJDK, but fetching icedtea fails. It was
> correctly done few weeks ago. Log indicates error on checksum, but I have
> reviewed changes on meta-java and I do not understand why. Anybody with the
> same issue?

Yes, I'm facing the same issue (discovered it after removing my
downloads folder and starting a new build).
For icedtea7-native the source archives upstream somehow have changed
(but the content is the same) and therefore calc to a new checksum.

Yesterday I've sent a patch for fixing this issue:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-October/109533.html

> 
> Regards,
> Joel
> 

regards,
RichardL

