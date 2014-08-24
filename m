Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0579C70FC5;
	Sun, 24 Aug 2014 23:27:21 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so8891043iec.40
	for <multiple recipients>; Sun, 24 Aug 2014 16:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oXj3T4ymT2959vNmccqaJowJRixHrwZjcgOjfDabjeI=;
	b=A6DqzWQVRG7AW5t4f4hfE9hTJh1o6PE4FZlS3KbwxmtwvH2jK2Xrh+yL+uJqPACZUg
	UmpSODJs+5cQIAIG9n5mqlWP4T+Xbj/KMM24WB43tJKngmthJYpHzvBSfhdkhsJG3Bhi
	JhRGZH3xerYjXwh91Cz1GVW8+f+/BKJ4sgaJ2avL+06BDwOfMC3e1rP/SnAA6kSARL+P
	3d6iGVMMy+AlnUNmtQ3sblVEibvmW0u2DFmdVRCIBHaT860Tg8Ss62I65RQ9DJb2iGHJ
	1uXsI9LRMzGKCOU8+4L25zfIzV3oRBeI/dUzodeKfCXLrLWMJ1Ckv6jfq+v6qlbS3DW5
	yi6A==
X-Received: by 10.50.39.8 with SMTP id l8mr12132162igk.13.1408922842367; Sun,
	24 Aug 2014 16:27:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Sun, 24 Aug 2014 16:26:52 -0700 (PDT)
In-Reply-To: <20140824223127.GN20524@jama>
References: <20140823082635.A959850251@opal.openembedded.org>
	<20140824223127.GN20524@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Aug 2014 16:26:52 -0700
Message-ID: <CAMKF1soKopQn4kExeC=wUxCGrHMMoYkNyzO6Sy9VpmDQbddEPA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: mkvtoolnix broken by boost upgrade Was: [oe-commits] Saul Wold : boost: Upgrade to 1.56.0
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
X-List-Received-Date: Sun, 24 Aug 2014 23:27:26 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 24, 2014 at 3:31 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Aug 23, 2014 at 08:26:35AM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: a6afd754290cecbe57392d13477557051b438817
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a6afd754290cecbe57392d13477557051b438817
>>
>> Author: Saul Wold <sgw@linux.intel.com>
>> Date:   Tue Aug 19 07:49:09 2014 -0700
>>
>> boost: Upgrade to 1.56.0
>>
>> Rebase boostconfig to handle moved user-config file
>
> FYI: This breaks mkvtoolnix:
>
> |      CXX src/common/iso639.cpp
> | src/common/iso639.cpp: In function 'int map_to_iso639_2_code(const string&, bool)':
> | src/common/iso639.cpp:595:30: error: 'class boost::range::index_value<const iso639_language_t&, int>' has no member named 'english_name'
> |      auto names = split(lang->english_name, ";");
> |                               ^
>

apply this
https://trac.bunkus.org/changeset/0c89ff941bfdd9f3378312f293a84f13cf3e2a96


>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> ---
>>
>>  .../boost/{bjam-native_1.55.0.bb => bjam-native_1.56.0.bb}        | 0
>>  meta/recipes-support/boost/{boost-1.55.0.inc => boost-1.56.0.inc} | 4 ++--
>>  meta/recipes-support/boost/boost.inc                              | 8 ++++----
>>  meta/recipes-support/boost/{boost_1.55.0.bb => boost_1.56.0.bb}   | 0
>>  4 files changed, 6 insertions(+), 6 deletions(-)
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

