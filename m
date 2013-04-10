Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1UPwQJ-0005ZT-Vg
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 16:54:58 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Wed, 10 Apr 2013
	16:37:33 +0200
X-TM-IMSS-Message-ID: <69b0324a00050772@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 69b0324a00050772 ;
	Wed, 10 Apr 2013 16:37:36 +0200
Message-ID: <5165792D.9070200@nedap.com>
Date: Wed, 10 Apr 2013 16:37:33 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <51656126.2020505@nedap.com> <2047971.fHFQ1GD4mc@helios>
In-Reply-To: <2047971.fHFQ1GD4mc@helios>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: dropbear
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 14:55:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2013 04:04 PM, Paul Eggleton wrote:
> On Wednesday 10 April 2013 14:55:02 Jaap de Jong wrote:
>> dropbear 2013.56 is currently the most recent version.
>> Although not documented, they left out the functionality patched in with
>> allow-nopw.patch in the 2013.56 release.
> How did you find this out?
the patch fails and inspection of the code learns that it can't be applied.
I found some other way to accomplish the same though..

diff -urN a/svr-runopts.c b/svr-runopts.c
--- a/svr-runopts.c    2013-03-21 16:29:35.000000000 +0100
+++ b/svr-runopts.c    2013-04-10 15:11:51.000000000 +0200
@@ -115,7 +115,7 @@
      svr_opts.norootlogin = 0;
      svr_opts.noauthpass = 0;
      svr_opts.norootpass = 0;
-    svr_opts.allowblankpass = 0;
+    svr_opts.allowblankpass = 1;
      svr_opts.inetdmode = 0;
      svr_opts.portcount = 0;
      svr_opts.hostkey = NULL;

> Cheers,
> Paul
>


