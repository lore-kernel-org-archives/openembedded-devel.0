Return-Path: <jaap.dejong@nedap.com>
X-Greylist: delayed 906 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Jun 2016 14:15:02 UTC
Received: from smtp.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id 2DFD0606D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 14:15:02 +0000 (UTC)
Received: from NVS0469.nedap.local (10.1.8.60) by NVS0468.nedap.local
	(10.1.8.59) with Microsoft SMTP Server (TLS) id 15.0.1044.25;
	Thu, 30 Jun 2016 15:59:54 +0200
Received: from NVS0469.nedap.local (10.1.8.60) by NVS0469.nedap.local
	(10.1.8.60) with Microsoft SMTP Server (TLS) id 15.0.1044.25;
	Thu, 30 Jun 2016 15:59:52 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by RelayNVS0469.nedap.local
	(10.1.8.60) with Microsoft SMTP Server id 15.0.1044.25 via Frontend
	Transport; Thu, 30 Jun 2016 15:59:52 +0200
X-TM-IMSS-Message-ID: <252f22940045253d@nedap.com>
Received: from [10.2.16.77] ([10.2.16.77]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 252f22940045253d ;
	Thu, 30 Jun 2016 15:59:55 +0200
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <577525BE.6020602@nedap.com>
Date: Thu, 30 Jun 2016 15:59:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: opkg v0.3.2 bug
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
X-List-Received-Date: Thu, 30 Jun 2016 14:15:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

I've already put this in 
https://groups.google.com/forum/#!topic/opkg-devel but I really want to 
hear what your experiences are.

I have this package A for which package B has a dependency?

I was using v0.2.3 before and 'opkg remove A' did not remove it.

With v0.3.2 the same errors:
Removing package A from root...
Collected errors:
  * print_dependents_warning: Package A is depended upon by packages:
  * print_dependents_warning:         B
  * print_dependents_warning: These might cease to work if package A is 
removed.
  * print_dependents_warning: Force removal of this package with 
--force-depends.
  * print_dependents_warning: Force removal of this package and its 
dependents
  * print_dependents_warning: with --force-removal-of-dependent-packages.

But package A is removed nevertheless....
This sounds as a severe error!
Or is it me doing something wrong??

Thanks,
Jaap




