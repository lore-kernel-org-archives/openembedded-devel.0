Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id BB72C71637
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2015 13:57:29 +0000 (UTC)
Received: by wivr20 with SMTP id r20so9371016wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Mar 2015 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=dwlLG05FRM3dpo03fAUVV/4jSYjf+58xTB4rlArW+44=;
	b=WbbGnLruk2GpsFiO+r8gLFzIE82XtCb5yhLB5zRI58JLz9/f4+PG99g1twAWfbuj4H
	jP03L+qdPQKDph/FdI8dKQbo5rc3/6vNp3iHXZXM/0IEUPYfarwIiQdrf+uExSXMyH1I
	4Aj4StCWCrQIP68uILyyqq9MlLlQyOX66oXXy4rl82/gwW1jvRT3ddM3yrY5j0k0aQZR
	wBibUC11eZD0qU4zg1aAs2hiHUpDptaU0sBIMy/VEUq5IvLNbeh8AX8oRNKJNwDYzofB
	oo2bMyqvw8r/dF9+jM5GwMBpmf5w7fQ3NCIqqshIjMhmSIAz2xU+F18br3E1yoFZcNdn
	AwyQ==
X-Received: by 10.194.133.196 with SMTP id pe4mr24727872wjb.76.1425218250462; 
	Sun, 01 Mar 2015 05:57:30 -0800 (PST)
Received: from [192.168.50.198] (ip-84-119-96-251.unity-media.net.
	[84.119.96.251])
	by mx.google.com with ESMTPSA id l6sm14771061wjx.33.2015.03.01.05.57.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 Mar 2015 05:57:29 -0800 (PST)
Message-ID: <54F31AC9.5020308@gmail.com>
Date: Sun, 01 Mar 2015 14:57:29 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1424512336-47007-1-git-send-email-sven.ebenfeld@gmail.com>	<1424512336-47007-4-git-send-email-sven.ebenfeld@gmail.com>
	<20150301061927.GR2309@jama>
In-Reply-To: <20150301061927.GR2309@jama>
Subject: Re: [meta-oe][PATCH 3/7] libgee: Update to Version 0.16.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Mar 2015 13:57:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Am 01.03.2015 um 07:19 schrieb Martin Jansa:
> On Sat, Feb 21, 2015 at 10:52:11AM +0100, Sven Ebenfeld wrote:
>> ---
>>  meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb | 10 ++++++++++
>>  meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb  | 10 ----------
>>  2 files changed, 10 insertions(+), 10 deletions(-)
>>  create mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb
>>  delete mode 100644 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
> 
> be aware that this change breaks some components, because libgee's
> pkgconfig file was renamed from gee-1.0 to gee-0.8 in
> https://github.com/GNOME/libgee/commit/e6fc195b449f1462bd6eea962799b814ad2c519b
> 

You are right, the website of libgee states incompatibility between
these two versions. But I've only found two recipes in oe-core and
meta-openembedded, that had libgee as dependency.

Vala-Dbus-binding-tool in version 0.4.1 required the newer libgee
version. The other recipe (sry, I don't remember which one it was)
compiled well even with the change to the newer version.

If there are recipe that can't be switchted to the newer version of
libgee, I think we should rename the recipes to libgee0.6_0.6.4 and
libgee0.8_0.16.1.

Cheers,
Sven

