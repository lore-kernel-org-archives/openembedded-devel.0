Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68327C77B7E
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 02:41:42 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.435.1684896095141564769
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 19:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Zf6hazb0;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53482b44007so279217a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 19:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684896094; x=1687488094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Du6IdBU74akEJByedNxIPVVePEkJf+XQkdORyeCmxYY=;
        b=Zf6hazb05TAQxpqJN+zHjDj4P2N4rrI1clvaMiTUqar8JY1ie0mSqSzELcNKQTp4Nx
         DGM8jpmG9JqTr8mLcLEvto/YnOpigiwBxUEcJTqmx+5VsA8XNqns1TxmrhCbcZZfBSPc
         GeWt8a8M2AsEVYPWsUn1HKG+NjsMEcaGxvfxEGDW6SaAoljql+5t2Q6Wb4bsWxOJqRkL
         XcJ73sB1pzpDYIQp6cR4oRiPiM+R9sJeCfctwaJX8eQS9ewcNVEn7k6gdPqUKj5SWVlX
         RopSg2jZZtNHsPLBL87Y4IXVkz5kMDzTSgL8NlEPhGaG0h87Q1p8FEUOtE3dGtI45YQL
         2LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684896094; x=1687488094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Du6IdBU74akEJByedNxIPVVePEkJf+XQkdORyeCmxYY=;
        b=IOfwS2092F31BMy6JVtlcmKi8ARXZPTcYZwvdeAXjxcZyak+vhlmepFbjabQssmXC9
         3RxsIwkCarnY7eryLN2rXNeZBi64BsOuuF4HHMKvyFwPTgXo8Aj1D6xMltwqTA1ki39W
         8ee9LffFyAqp9HG2vz7/uqaY5R98g6xkNUaAK5+xRBdko9H3Fn7/zj2NMmyMiV0jZAtO
         8BWb8r7IGkYJpw3Gj5HBQYls52r3l/zMFDQiucNwCNegHLzmATg/yqzHQpOJTB+pyFmI
         tRrlm4k7BltTIuSBGNCJKlK2hTF5Rl2//Tdw3fbjfXGpIes9SctRzlJUsIn4+ilAmWoo
         k1PA==
X-Gm-Message-State: AC+VfDyRlj7lQ+XQ/DSZk5WOXeNGFQmsrih+/6b1QXmk35ImTjbdsWMb
	9E8ukvmA7BkfXeBapIWjl0I=
X-Google-Smtp-Source: ACHHUZ6y8k1aSpLxExwd+QI8reBhBrxflUhnmCVo2l1Uw0SI3TomAYPVveScNVhrNnwmUpg4iY5fPQ==
X-Received: by 2002:a17:902:e74e:b0:1af:ccc9:ce5a with SMTP id p14-20020a170902e74e00b001afccc9ce5amr3601304plf.24.1684896094233;
        Tue, 23 May 2023 19:41:34 -0700 (PDT)
Received: from [192.168.153.47] ([12.32.73.67])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090282c600b0019a773419a6sm7437112plz.170.2023.05.23.19.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 19:41:33 -0700 (PDT)
Message-ID: <b3dc5cc8-5db1-d3ab-97e0-592a0995c19a@gmail.com>
Date: Tue, 23 May 2023 22:41:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-python][hardknott][PATCH 2/2] python3-django: upgrade
 3.2.5 -> 3.2.12
To: Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-devel@lists.openembedded.org,
 "Mali, Narpat" <narpat.mali@windriver.com>
Cc: "Reyna, David" <david.reyna@windriver.com>, Khem Raj
 <raj.khem@gmail.com>, Trevor Gamblin <trevor.gamblin@windriver.com>
References: <20220323173332.16576-1-trevor.gamblin@windriver.com>
 <20220323173332.16576-2-trevor.gamblin@windriver.com>
 <0611ffa9-537e-0186-2c99-d3e092b2bdb1@windriver.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <0611ffa9-537e-0186-2c99-d3e092b2bdb1@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 02:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102749



On 5/23/23 5:58 PM, Randy MacLeod wrote:
> On 2022-03-23 13:33, Trevor Gamblin wrote:
>> The delta between 3.2.5 and 3.2.12 contain numerous CVE and other
>> bugfixes. git log --oneline 3.2.5..3.2.12 shows:
>
> Narpat is working on a patch for: CVE-2023-31047
>
> He'll start with the default version of django : 2.2*
>
> Which if any of the other versions should be fixed?
>
> Can we remove version 3.2?
> Can we update django 4.0 to 4.1 rather than backport the fix?
>
> meta-oe.git on  kirkstone [$]
> ❯ fd django_
> meta-python/recipes-devtools/python/python3-django_2.2.28.bb
> meta-python/recipes-devtools/python/python3-django_3.2.12.bb
> meta-python/recipes-devtools/python/python3-django_4.0.2.bb
>
> Can we add a check to ensure that we never have 3 versions of a single
> recipe at branch time again? It's rare I think but worth discussing 
> the idea.
>

If we have 4, it meets your requirements ; )

- armin
>
>
> ../Randy
>
>
>> fdf209eab8 (tag: 3.2.12) [3.2.x] Bumped version for 3.2.12 release.
>> d16133568e [3.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in file uploads.
>> 1a1e8278c4 [3.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {% debug %} template tag.
>> a7e89fe776 [3.2.x] Added stub release notes for 3.2.12 and 2.2.27.
>> 027f4c4ceb [3.2.x] Added CVE-2021-45115, CVE-2021-45116, and CVE-2021-45452 to security archive.
>> 0a9a46a1d7 [3.2.x] Post-release version bump.
>> 6e499a28ac (tag: 3.2.11) [3.2.x] Bumped version for 3.2.11 release.
>> 8d2f7cff76 [3.2.x] Fixed CVE-2021-45452 -- Fixed potential path traversal in storage subsystem.
>> c7fe895bca [3.2.x] Fixed CVE-2021-45116 -- Fixed potential information disclosure in dictsort template filter.
>> a8b32fe13b [3.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in UserAttributeSimilarityValidator.
>> b0aa0709a5 [3.2.x] Added stub release notes for 3.2.11, and 2.2.26 releases.
>> ae242235db [3.2.x] Refs #33365, Refs #30530 -- Doc'd re_path() behavior change in Django 2.2.25, 3.1.14, and 3.2.10.
>> ecd2793897 [3.2.x] Added CVE-2021-44420 to security archive.
>> 1cea03ab00 [3.2.x] Post-release version bump.
>> 0153a63a67 (tag: 3.2.10) [3.2.x] Bumped version for 3.2.10 release.
>> 333c656030 [3.2.x] Fixed #30530, CVE-2021-44420 -- Fixed potential bypass of an upstream access control based on URL paths.
>> 6014b812e2 [3.2.x] Refs #33333 -- Fixed PickleabilityTestCase.test_annotation_with_callable_default() crash on Oracle.
>> cb724ef6c0 [3.2.x] Fixed #33333 -- Fixed setUpTestData() crash with models.BinaryField on PostgreSQL.
>> 0cf2d48ba8 [3.2.x] Added requirements.txt to files ignored by Sphinx builds.
>> 487a2da02e [3.2.x] Added stub release notes and release date for 3.2.10, 3.1.14 and 2.2.25.
>> 742d6bc8db [3.2.x] Corrected signatures of QuerySet's methods.
>> 99532fdadf [3.2.x] Corrected isort example in coding style docs.
>> 31539a63f2 [3.2.x] Corrected "pip install" call in coding style docs.
>> 76a0a8a917 [3.2.x] Configured Read The Docs to build all formats.
>> 04e66e245d [3.2.x] Fixed crash building HTML docs since Sphinx 4.3.
>> dfa1145a22 [3.2.x] Corrected multiply defined labels in docs.
>> 9d171643d4 [3.2.x] Refs #33247 -- Corrected configuration for Read The Docs.
>> 327dac6e7c [3.2.x] Fixed #33247 -- Added configuration for Read The Docs.
>> bc691d555e [3.2.x] Corrected module reference in contributing tutorial.
>> 3357ad2de2 [3.2.x] Fixed typo in docs/topics/logging.txt.
>> 34e5e61479 [3.2.x] Added stub release notes for Django 3.2.10.
>> 21a56d596a [3.2.x] Post-release version bump.
>> 1b3c0d3b54 (tag: 3.2.9) [3.2.x] Bumped version for 3.2.9 release.
>> e299cc2d2c [3.2.x] Added release date for 3.2.9.
>> 947d2707c6 [3.2.x] Added Google Cloud Spanner to list of third-party DB backends.
>> 128179c0f8 [3.2.x] Refs #33182 -- Adjusted custom admin theming example to use correct template block.
>> f5802a21c4 [3.2.x] Fixed #33194 -- Fixed migrations when altering a field with functional indexes on SQLite.
>> fdc1c6435c [3.2.x] Fixed #33198 -- Corrected BinaryField.max_length docs.
>> dbcd81841f [3.2.x] Refs #32074 -- Removed usage of deprecated asyncore and smtpd modules.
>> 137a9899d7 [3.2.x] Refs #27131 -- Removed SMTPBackendTests.test_server_login().
>> 1128291650 [3.2.x] Added 'formatter' to spelling wordlist.
>> 82fee0446d [3.2.x] Refs #32074 -- Doc'd Python 3.10 compatibility in Django 3.2.x.
>> 1aed4663c3 [3.2.x] Refs #32074 -- Added Python 3.10 to classifiers and tox.ini.
>> 53fad80ffe [3.2.x] Refs #32074 -- Used asyncio.get_running_loop() instead of get_event_loop() on Python 3.7+.
>> f6726fdc3e [3.2.x] Refs #32074 -- Fixed find_module()/find_loader() warnings on Python 3.10+.
>> d0dc446444 [3.2.x] Refs #32074 -- Removed usage of deprecated Thread.setDaemon().
>> 8bebb1c04a [3.2.x] Refs #32074 -- Removed usage of Python's deprecated distutils.version package.
>> faeae84dad [3.2.x] Skipped test_archive tests when bz2/lzma module is not installed.
>> 329311ecbd [3.2.x] Added stub release notes for Django 3.2.9.
>> 85e4af6a22 [3.2.x] Post-release version bump.
>> 4540e976d4 (tag: 3.2.8) [3.2.x] Bumped version for 3.2.8 release.
>> 65367b0500 [3.2.x] Added release date for 3.2.7.
>> 51e4dbfeb2 [3.2.x] Refs #27694 -- Doc'd lookups that can be chained with HStoreField key transforms.
>> 031ffc5c84 [3.2.x] Corrected field and model check messages in docs.
>> 7607fe922f [3.2.x] Removed obsolete GEOS 3.5 requirement note.
>> 6760f4fa25 [3.2.x] Fixed #33083 -- Fixed selecting all items in the admin changelist when actions are both top and bottom.
>> e235c7815a [3.2.x] Fixed broken links and redirects in docs.
>> 51e76c922f [3.2.x] Used :rfc: role in docs/topics/conditional-view-processing.txt.
>> d4a587a5fa [3.2.x] Fixed #33077 -- Fixed links to related models for admin's readonly fields in custom admin site.
>> 561a1c0905 [3.2.x] Fixed typo in docs/intro/reusable-apps.txt.
>> 454ee4d3b8 [3.2.x] Corrected outputs and made cosmetic edits in GeoDjango tutorial.
>> b51e0a37cf [3.2.x] Doc'd Jinja2 form renderer.
>> a7be74d017 [3.2.x] Clarified type of Window()'s partition_by and order_by arguments.
>> 54684a3ec0 [3.2.x] Refs #31055 -- Doc'd 'databases' argument of check functions.
>> 1f86ff31b1 [3.2.x] Fixed typo in docs/topics/i18n/formatting.txt.
>> b61f44c339 [3.2.x] Fixed #33082 -- Fixed CommandTests.test_subparser_invalid_option on Python 3.9.7+.
>> 707239eabf [3.2.x] Added stub release notes for Django 3.2.8.
>> d5710f405a [3.2.x] Post-release version bump.
>> 45a0c54b67 (tag: 3.2.7) [3.2.x] Bumped version for 3.2.7 release.
>> 4b80a40272 [3.2.x] Added release date for 3.2.7.
>> 4e55806720 [3.2.x] Refs #25264 -- Doc's that not all default options are supported by every management command.
>> fe3a854e1d [3.2.x] Fixed #32992 -- Restored offset extraction for fixed offset timezones.
>> 382374a360 [3.2.x] Corrected BaseDatabaseSchemaEditor.execute() signature in docs.
>> 11b2cbb65f [3.2.x] Made sentence about Model consistent in docs.
>> 69009f4952 [3.2.x] Fixed #33046 -- Added note about using length of cached result by QuerySet.count().
>> d95a0144e5 [3.2.x] Used backend vendors in custom model fields docs.
>> 358e65a5cd [3.2.x] Fixed #33030 -- Fixed broken links to GDAL docs.
>> d29a9ed504 [3.2.x] The geodjango mailing list moved to the Django Forum.
>> eb26b8a0fe [3.2.x] The django-i18n mailing list moved to the Django Forum.
>> 6bb74f3de8 [3.2.x] Fixed some broken links and redirects in docs.
>> f18da11b8a [3.2.x] Updated BaseDatabaseFeatures link in testing tools docs.
>> 2c46e55314 [3.2.x] Clarified URL patterns in tutorial 3.
>> 87e7399760 [3.2.x] Added stub release notes for Django 3.2.7.
>> e1cad66dca [3.2.x] Post-release version bump.
>> eb0f298e76 (tag: 3.2.6) [3.2.x] Bumped version for 3.2.6 release.
>> 70840232f9 [3.2.x] Confirmed release date for Django 3.2.6.
>> d9e05ea17a [3.2.x] Refs #31676 -- Updated technical board description in organization docs.
>> 99d9a3ef7c [3.2.x] Refs #31676 -- Added Mergers and Releasers to organization docs.
>> ed29959812 [3.2.x] Refs #31676 -- Removed Core team from organization docs.
>> 55daaa0c79 [3.2.x] Made minor edits to QuerySet.update_or_create() docs.
>> 5fa70c91b4 [3.2.x] Fixed typo in docs/ref/contrib/admin/index.txt.
>> aace6c531d [3.2.x] Fixed #32933 -- Documented BoundField.initial as preferred over Form.get_initial_for_field().
>> bdd4cbe84a [3.2.x] Fixed #32957 -- Improved visibility of arguments sections in Model.save() docs.
>> b2f7b53fac [3.2.x] Fixed #32947 -- Fixed hash() crash on reverse M2M relation when through_fields is a list.
>> de5a044cf4 [3.2.x] Fixed #32950 -- Removed myproject from imports in admin docs where appropriate.
>> f4cf86f870 [3.2.x] Refs #32949 -- Adjusted release note wording.
>> 1346381760 [3.2.x] Fixed #32949 -- Restored invalid number handling in DecimalField.validate().
>> 05e997c404 [3.2.x] Fixed typo in docs/ref/databases.txt.
>> 9a65e62c93 [3.2.x] Fixed typo in docs/releases/3.1.13.txt.
>> 0ee092c8dd [3.2.x] Fixed typo in docs/topics/signals.txt.
>> b7d25d025e [3.2.x] Fixed typo in docs/internals/deprecation.txt.
>> 6931963886 [3.2.x] Fixed typo in docs/internals/contributing/committing-code.txt.
>> f36edbc378 [3.2.x] Refs #31676 -- Removed Django Core-Mentorship mailing list references in docs.
>> 527482c513 [3.2.x] Fixed typo in docs/ref/contrib/gis/tutorial.txt.
>> 1d53d2502d [3.2.x] Documented in_bulk behavior with nonexistent id_list items.
>> 9fadb97583 [3.2.x] Added CVE-2021-35042 to security archive.
>> 92efd69107 [3.2.x] Added stub release notes for Django 3.2.6.
>> 3ab942f10a [3.2.x] Post-release version bump.
>>
>> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
>> ---
>>   .../{python3-django_3.2.5.bb => python3-django_3.2.12.bb}       | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-python/recipes-devtools/python/{python3-django_3.2.5.bb => python3-django_3.2.12.bb} (77%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>> similarity index 77%
>> rename from meta-python/recipes-devtools/python/python3-django_3.2.5.bb
>> rename to meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>> index 5890c8541..ee71f953b 100644
>> --- a/meta-python/recipes-devtools/python/python3-django_3.2.5.bb
>> +++ b/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
>> @@ -1,7 +1,7 @@
>>   require python-django.inc
>>   inherit setuptools3
>>   
>> -SRC_URI[sha256sum] = "3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841dda35019c01855cd"
>> +SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
>>   
>>   RDEPENDS_${PN} += "\
>>       ${PYTHON_PN}-sqlparse \
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96163):https://lists.openembedded.org/g/openembedded-devel/message/96163
>> Mute This Topic:https://lists.openembedded.org/mt/89981302/3616765
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> -- 
> # Randy MacLeod
> # Wind River Linux


