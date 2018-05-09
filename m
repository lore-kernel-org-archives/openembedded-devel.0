Return-Path: <sipke.vriend@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id E055674576
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 23:00:23 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id q4-v6so943355ite.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 16:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6ppEzJtaGEg21yifUWi4n7tbL+MJfT00fEnCnaH2Ii0=;
	b=ZqtjgvL0E3SfmiLvfxrHvgn0B8kQIAe/KXmiE5I+piEg7MHrn2oPukzlJCob+10W3n
	NP3zZ5oEarOrTOUchSV41tOL4xg5Z8wknny+pryDZZRF0Nmw8EoaCa7gP6ay0g2tELGe
	W1r9XTng3O+Mc9v15MJBk3EM46zhOkxW04sn9/cOBSv4zczfFprtTUIZ+a+WWLVagj28
	UAAuD6fQSYV+W5doi8mdyDu/kyhrpgJRmkCFPyFavbucnZKz/VFnlQXgvXzA42a9HMYP
	6DsEPy8+ZXI5eIz9OE3ETgREaoUqKOpHUKVp/ApbAoz8gUIxHbKemxXSW92de2B+NGLC
	RYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6ppEzJtaGEg21yifUWi4n7tbL+MJfT00fEnCnaH2Ii0=;
	b=XxxYY1lAcYnJ8jgNAFvX3Qv0t6+q36QcYSQbT1GqPJTZIjh2qP1SPLP+8JJntqW8CS
	CCbjy7fMenPt5fuYFMFamstsIQ6iQUKRBxsbWEk16ZVZfPGQAtpW/zTEMv+aSxvz400s
	2ZbEDHS4+cMMHRlrAvVc+vUN8NUCRoi7lZebsmVtT05FgmyropwwLqb7NXjxVPx1kIUU
	xqXEBRuR4NLCWUXLHxOiFuJJx53OvArpqaJWfMp9PDk+jMvYSOtK5BB+JnOCMWrCCSW3
	hCzc40HboY42BpW7n/+TIEpYmbW3YGp5fnJ92rSm4hTKFRFrwy6x1I9WNmwCCqWudSQ1
	/4JA==
X-Gm-Message-State: ALKqPwer1xhsIL5Ml/xR7vlRg5TCSuSbBoflOI0CALqlvDOBvqIsZQnR
	r9OSNRxDCMHwc/c+ViZmhekc408hcPl1ITArDBw=
X-Google-Smtp-Source: AB8JxZrWY6wYCJbIEMu7uuiIYZrP8DPBqU2fSmaQimF8dOO531FaeJRXoJrXRY3iPTPP1h374/emlcv5UCpF2Of5klE=
X-Received: by 2002:a24:7554:: with SMTP id y81-v6mr2711088itc.1.1525906824444;
	Wed, 09 May 2018 16:00:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.188.71 with HTTP; Wed, 9 May 2018 16:00:24 -0700 (PDT)
In-Reply-To: <CANx9H-CnBpsQK4NT9KJrRqDE0wQDvBcvqd-GVwnCo0MMWTA6bA@mail.gmail.com>
References: <1525829867-22734-1-git-send-email-sipke.vriend@gmail.com>
	<CANx9H-CnBpsQK4NT9KJrRqDE0wQDvBcvqd-GVwnCo0MMWTA6bA@mail.gmail.com>
From: Simonjan Vriend <sipke.vriend@gmail.com>
Date: Thu, 10 May 2018 09:00:24 +1000
Message-ID: <CAA7EKzB8rg3fuef=FYy3ze+SQU_=p-STBReQarEr0Xx0jDz4GQ@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-robotframework: Add runtime dependencies to robot framework
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
X-List-Received-Date: Wed, 09 May 2018 23:00:24 -0000
Content-Type: text/plain; charset="UTF-8"

Will add comment and resubmit.

On Wed, May 9, 2018 at 11:02 PM, Tim Orling <ticotimo@gmail.com> wrote:

> Please also provide patch for python3-robotframework or indicate it is not
> needed.
> On Tue, May 8, 2018 at 6:38 PM Sipke Vriend <sipke.vriend@gmail.com>
> wrote:
>
>> Add the runtime dependencies robot framework has so they are available on
>> images including it.
>>
>> Signed-off-by: Sipke Vriend <sipke.vriend@gmail.com>
>> ---
>>  meta-python/recipes-devtools/python/python-robotframework.inc | 11
>> +++++++++++
>>  .../recipes-devtools/python/python-robotframework_3.0.2.bb    |  4 ++++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-robotframework.inc
>> b/meta-python/recipes-devtools/python/python-robotframework.inc
>> index cc20d64..78bbbc6 100644
>> --- a/meta-python/recipes-devtools/python/python-robotframework.inc
>> +++ b/meta-python/recipes-devtools/python/python-robotframework.inc
>> @@ -13,3 +13,14 @@ inherit pypi
>>
>>  SRC_URI[md5sum] = "ea49a54b9d7e38302712194e85c37eaa"
>>  SRC_URI[sha256sum] = "2018f233568227f9af8c366f93e243
>> a157b742f3baf5b649ecc9750ac0ee1ff7"
>> +
>> +RDEPENDS_${PN} += " \
>> +    ${PYTHON_PN}-shell \
>> +    ${PYTHON_PN}-pprint \
>> +    ${PYTHON_PN}-xml \
>> +    ${PYTHON_PN}-difflib \
>> +    ${PYTHON_PN}-threading \
>> +    ${PYTHON_PN}-html \
>> +    ${PYTHON_PN}-docutils \
>> +    ${PYTHON_PN}-ctypes \
>> +"
>> diff --git a/meta-python/recipes-devtools/python/python-
>> robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/python-
>> robotframework_3.0.2.bb
>> index 16eaa78..ff7dedb 100644
>> --- a/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
>> +++ b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
>> @@ -1,2 +1,6 @@
>>  inherit setuptools
>>  require python-robotframework.inc
>> +
>> +RDEPENDS_${PN} += " \
>> +    ${PYTHON_PN}-zlib \
>> +"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

