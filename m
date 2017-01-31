Return-Path: <jaragunde@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDD0601D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 17:49:24 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AqQTi9hF/xkVTl239r9bqc51GYnF86YWxBRYc798d?=
	=?us-ascii?q?s5kLTJ7zps6wAkXT6L1XgUPTWs2DsrQf2raQ7f2rADRcqb+681k6OKRWUBEEjc?=
	=?us-ascii?q?hE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRo?=
	=?us-ascii?q?LerpBIHSk9631+ev8JHPfglEnjSwbLd9IRmsrAjctsYajZZ+Jqs+1xDEvmZGd+?=
	=?us-ascii?q?NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG4p6sLrswLD?=
	=?us-ascii?q?TRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Uims4qt3VBPljj?=
	=?us-ascii?q?oMOjgk+2/Vl8NwlrpWrg+/qRxxw4DaY4+bO/RxcazfYdwUSnFMXtpTWiFbHo+w?=
	=?us-ascii?q?c4UCAuoHMO1Fr4f9vVwOrR6mCAeoHuzg1jhIiWTx3aIiz+khCxvJ3AM9H9IIrX?=
	=?us-ascii?q?vbss36Or0IVuCv0qbJzCjIYvRU2Tjn8ojHaB8hoeyKXb1tb8Xc0kgvFwzfgVWU?=
	=?us-ascii?q?qIzqJSmZ2fgKs2ie9udtU/+khW0/qwxppjWj290ghpTUio8X0FzJ8SF0zJwoKd?=
	=?us-ascii?q?C4SEN2Z8OvHoFKuCGALYR2R9svQ2RvuCkn1LILoYW7fC0WyJQ/wB7fduCHf5CI?=
	=?us-ascii?q?4h39UOaRJi91hHx/d7K5hhey8E6gxfPmWsm131ZFtC5FktjWuXwXyxPT7c2HRu?=
	=?us-ascii?q?N8/kenxzmPyxje5+VZLUwuiKbXNpwszqQ0m5cXq0jPAy/7lUXugK+TbEok++yo?=
	=?us-ascii?q?6+r9YrXho5+RL410hRvkMqs0lcy/HOI4PRUQUGWA+OS826fs/Un4QLpQlPE5jq?=
	=?us-ascii?q?7ZsJXCKcQBuqG5GxNV0pok6xunCDemyMoXnX8ZI1JAYx2IkZXmNEzQL//lFPuw?=
	=?us-ascii?q?nkqjkCl1yPDCJbDhBpTNLmPfkLf6Z7p97FZcxxQ1zd9B4pJbEa8OL+/uVUDvqd?=
	=?us-ascii?q?PUFBg5Mxa7w7WvNNIo0ZsTX2+KCKKVPK7e9FOF+O8rC+2Nf5MO/jHlJv4o4vTj?=
	=?us-ascii?q?gXM0lRkaZ6b684EQbSWaF/9hKUKuSGDljcoHHWo9hoskQf6i3F+LSzdcenC+Uo?=
	=?us-ascii?q?o96Tg/CYvgBoDGENP+yIed1Tu2S8UFLltNDUqBRC/l?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2CwGACszZBY/5tjdVtdGwEXAQYBDBgHg?=
	=?us-ascii?q?x2BC48wkHYflVsZgUyCbIM2AoI1QxQBAQEBAQEBAQEBAWEogjMZgh4BBYEJCxg?=
	=?us-ascii?q?uVxMIAQGJbgGuPoszATGGS4IFCIJihRiFGQWIfId+il2RfpB4kn82IYFLhwo/i?=
	=?us-ascii?q?F8BAQE?=
X-IPAS-Result: =?us-ascii?q?A2CwGACszZBY/5tjdVtdGwEXAQYBDBgHgx2BC48wkHYflVs?=
	=?us-ascii?q?ZgUyCbIM2AoI1QxQBAQEBAQEBAQEBAWEogjMZgh4BBYEJCxguVxMIAQGJbgGuP?=
	=?us-ascii?q?oszATGGS4IFCIJihRiFGQWIfId+il2RfpB4kn82IYFLhwo/iF8BAQE?=
X-IronPort-AV: E=Sophos;i="5.33,315,1477954800"; d="scan'208";a="234684136"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 31 Jan 2017 18:49:23 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYcYV-0001OL-Sl for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 18:49:23 +0100
Received: from ip162.dynamic.igalia.com ([192.168.10.162])
	by mail.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cYcYV-0000oj-Q8 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2017 18:49:23 +0100
To: openembedded-devel@lists.openembedded.org
References: <997bde82-5208-6d17-3f4c-141258242a6e@mlbassoc.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <5f2967c3-4126-1807-d317-a134f522a287@igalia.com>
Date: Tue, 31 Jan 2017 18:49:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <997bde82-5208-6d17-3f4c-141258242a6e@mlbassoc.com>
Subject: Re: [meta-browser] chromium broken patch
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
X-List-Received-Date: Tue, 31 Jan 2017 17:49:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Gary,

I think I know what happened here; now there must be different versions
of this patch for chromium and chromium-wayland. Let me send a fix in a
while, would you kindly try it?

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia


On 31/01/17 17:17, Gary Thomas wrote:
> poky/yocto:   d45d4a5a21ab4209b87331dddf515ecdb62367fa
> meta-browser: d875f40c3a120118ddf998545dd7efba09d01cc1
> 
> ERROR: chromium-52.0.2743.76-r0 do_patch: Command Error: 'quilt --quiltrc 
> /build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/chromium/52.0.2743.76-r0/recipe-sysroot-native/etc/quiltrc 
> push' exited with 0  Output:
> Applying patch 0003-Remove-hard-coded-values-for-CC-and-CXX.patch
> patching file build/common.gypi
> Hunk #1 FAILED at 6027.
> 1 out of 1 hunk FAILED -- rejects in file build/common.gypi
> Patch 0003-Remove-hard-coded-values-for-CC-and-CXX.patch does not apply (enforce with -f)
> ERROR: chromium-52.0.2743.76-r0 do_patch: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in: 
> /build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-mx6qdl-amltd-linux-gnueabi/chromium/52.0.2743.76-r0/temp/log.do_patch.17216
> ERROR: Task (/local/poky-cutting-edge/meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_patch) failed 
> with exit code '1'
> 



