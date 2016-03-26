Return-Path: <ticotimo@gmail.com>
Received: from mail-lb0-f195.google.com (mail-lb0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 93DA66FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 17:24:53 +0000 (UTC)
Received: by mail-lb0-f195.google.com with SMTP id sx8so6983707lbb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=/Bjh/q6oKaIMQPw6urH+cKIP7/FF3x4dwdcN9c8DrN4=;
	b=Ar3a0sZUYTbtPsycQQzS9PAD7n7NPuKhUYrzS4/vE0O+N/j7sAGFSZPXc7SHwge3eg
	hGvW23XBrK8c/KyeXcDxuFGc7ArjqOnJMQocuVAaFQ+vEYrnp8j6UoZLIoWw3OqZXRQ4
	i5806G9qQN6C/yhRO2xxhrNudMeD4tf6uFp4f6Gcp1vlL9JKZ8rJnk0gZAleNDWQ+rDJ
	zWE2nSYqA74IlZAssEr0Hk5YkOfk6UOYkcFLw1h6okMCYwkwpPd0ADtFBGt06M1EMKU9
	H1pLH29a+Hs7ccHCcUos7Ivk6CS0427LLgU5mBvGjsiH6HiCxy8ycgrNX1cYunQmD076
	8dDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=/Bjh/q6oKaIMQPw6urH+cKIP7/FF3x4dwdcN9c8DrN4=;
	b=gT+wIlgolIS+JWHuAGfzf+EfznFCoh0/Ps6UeaY+yex4ca/s36lFUqE1U0GYl9ZpX7
	M4A35VVWT/qPH1Jdfdc0ucRIGDKFqvkldZpDPFHK/vyS4Cp/jXoX/zdYJg1t76Bwd3fr
	Mm/18U09WJXvZUmXtP+iMf5VcnfQdAScuTFk+tv1BGak7MYU1tYbpmkaG4rhRvtQvSLW
	MTmhhq1bbtWdiVAbbN0rx9g3U/+7fp5BvIjUjErWFZIkLQveZRUZB0yf9X1iES9WcxPR
	vQ2pGYREqiAzMlvhgmngDYlXIEJ5D+a+JGZ3XK8cRl8m2UUE6uGGnAcpvR9VN8Us2T98
	PaaQ==
X-Gm-Message-State: AD7BkJJxm0dvKEmJ83cj/k5hXqm+oRzeHpam6bGvh/nYLrvNGdo3Xs8SV0le1G/rtK7xbAQHsM24x1mhaiDuew==
MIME-Version: 1.0
X-Received: by 10.112.160.199 with SMTP id xm7mr6002372lbb.32.1459013092675;
	Sat, 26 Mar 2016 10:24:52 -0700 (PDT)
Received: by 10.25.214.137 with HTTP; Sat, 26 Mar 2016 10:24:52 -0700 (PDT)
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Date: Sat, 26 Mar 2016 10:24:52 -0700
Message-ID: <CANx9H-DkrnLF--Em7F42YCir6VaQTTU+YE+jyyv_d99h--xL1A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH 00/30] Updates current python packages to theeir respective latest versions
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
X-List-Received-Date: Sat, 26 Mar 2016 17:24:55 -0000
Content-Type: text/plain; charset=UTF-8

Wow. Thank you.

This has been on my backburnner list of things to do for ages.

--Tim

On Sat, Mar 26, 2016 at 6:04 AM, Derek Straka <derek@asterius.io> wrote:

> The set of patches brings most of the packages in meta-python up to the
> current released version.
>
> The following changes since commit
> bf8f27af3954ab68e39712516ab515de90b4db27:
>
>   gstreamer: fix argument parsing when using Bison 3 (2016-03-25 11:36:42
> +0100)
>
> are available in the git repository at:
>
>   git://github.com/derekstraka/meta-openembedded more-python-update
>   https://github.com/derekstraka/meta-openembedded/tree/more-python-update
>
> Derek Straka (30):
>   python-dateutil: update to 2.5.1
>   python-lxml: update to 3.6.0
>   python-cython: update to 0.23.4
>   python-certifi: update to 2016.2.28
>   python-pymongo: update to 3.2.2
>   python-werkzeug: update to 0.11.5
>   python-whoosh: update to 2.7.3
>   python-cffi: update to 1.5.2
>   python-cmd2: update to 0.6.8
>   python-daemonize: update to 2.4.6
>   python-evdev: update to 0.6.0
>   python-html5lib: update to 0.9999999
>   python-iso8601: update to 0.1.11
>   python-jsonpatch: update to 1.13
>   python-monotonic: update to 1.0
>   python-paste: update to 2.0.3
>   python-pep8: update to 1.7.0
>   python-pip: update to 8.1.1
>   python-psutil: update to 4.1.0
>   python-py: update to 1.4.31
>   python-pycparser: update to 2.14
>   python-pyflakes: update to 1.1.0
>   python-pymisp: update to 2.3
>   python-pyparsing: update to 2.1.1
>   python-pytest: update to 2.9.1
>   python-pytz: update to 2016.3
>   python-pyudev: update to 0.19.0
>   python-pyyaml: update to 3.11
>   python-sparts: update to version 0.7.3
>   python-urllib3: update to 1.14
>
>  meta-python/recipes-devtools/python/python-certifi.inc         |  4 ++--
>  ...hon-certifi_2015.11.20.1.bb => python-certifi_2016.2.28.bb} |  0
>  .../python/{python-cffi_1.3.1.bb => python-cffi_1.5.2.bb}      |  4 ++--
>  .../python/{python-cmd2_0.6.7.bb => python-cmd2_0.6.8.bb}      |  4 ++--
>  meta-python/recipes-devtools/python/python-cython.inc          |  4 ++--
>  .../{python-cython_0.23.1.bb => python-cython_0.23.4.bb}       |  0
>  .../{python-daemonize_2.4.2.bb => python-daemonize_2.4.6.bb}   |  4 ++--
>  meta-python/recipes-devtools/python/python-dateutil.inc        |  4 ++--
>  .../{python-dateutil_2.4.2.bb => python-dateutil_2.5.1.bb}     |  0
>  .../python/{python-evdev_0.5.0.bb => python-evdev_0.6.0.bb}    |  7
> ++++---
>  .../{python-html5lib_0.999.bb => python-html5lib_0.9999999.bb} |  4 ++--
>  meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb   |  8
> --------
>  meta-python/recipes-devtools/python/python-iso8601_0.1.11.bb   |  8
> ++++++++
>  .../{python-jsonpatch_1.12.bb => python-jsonpatch_1.13.bb}     |  4 ++--
>  meta-python/recipes-devtools/python/python-lxml.inc            |  4 ++--
>  .../python/{python-lxml_3.5.0.bb => python-lxml_3.6.0.bb}      |  0
>  .../{python-monotonic_0.6.bb => python-monotonic_1.0.bb}       |  4 ++--
>  .../python/{python-paste_2.0.2.bb => python-paste_2.0.3.bb}    |  4 ++--
>  .../python/{python-pep8_1.4.6.bb => python-pep8_1.7.0.bb}      |  6
> +++---
>  .../python/{python-pip_7.1.2.bb => python-pip_8.1.1.bb}        |  6
> +++---
>  .../python/{python-psutil_2.2.1.bb => python-psutil_4.1.0.bb}  |  4 ++--
>  .../python/{python-py_1.4.26.bb => python-py_1.4.31.bb}        |  4 ++--
>  meta-python/recipes-devtools/python/python-pycparser_2.10.bb   | 10
> ----------
>  meta-python/recipes-devtools/python/python-pycparser_2.14.bb   | 10
> ++++++++++
>  .../{python-pyflakes_1.0.0.bb => python-pyflakes_1.1.0.bb}     |  6
> +++---
>  meta-python/recipes-devtools/python/python-pymisp.inc          | 10
> +++-------
>  .../python/{python3-pymisp_2.2.bb => python-pymisp_2.3.bb}     |  2 +-
>  meta-python/recipes-devtools/python/python-pymongo.inc         |  4 ++--
>  .../python/{python-pymongo_3.2.bb => python-pymongo_3.2.2.bb}  |  0
>  .../{python-pyparsing_2.0.3.bb => python-pyparsing_2.1.1.bb}   |  4 ++--
>  meta-python/recipes-devtools/python/python-pytest_2.7.0.bb     | 10
> ----------
>  meta-python/recipes-devtools/python/python-pytest_2.9.1.bb     | 10
> ++++++++++
>  .../python/{python-pytz_2015.4.bb => python-pytz_2016.3.bb}    |  4 ++--
>  .../{python-pyudev_0.16.1.bb => python-pyudev_0.19.0.bb}       |  4 ++--
>  .../python/{python-pyyaml_3.10.bb => python-pyyaml_3.11.bb}    |  4 ++--
>  .../python/{python-sparts_0.7.2.bb => python-sparts_0.7.3.bb}  |  9
> +++------
>  .../{python-urllib3_1.10.1.bb => python-urllib3_1.14.bb}       | 10
> +++-------
>  meta-python/recipes-devtools/python/python-werkzeug.inc        |  4 ++--
>  .../{python-werkzeug_0.11.3.bb => python-werkzeug_0.11.5.bb}   |  0
>  meta-python/recipes-devtools/python/python-whoosh.inc          |  5 +++--
>  .../python/{python-whoosh_2.7.0.bb => python-whoosh_2.7.3.bb}  |  0
>  ...n3-certifi_2015.11.20.1.bb => python3-certifi_2016.2.28.bb} |  0
>  .../{python3-cython_0.23.1.bb => python3-cython_0.23.4.bb}     |  0
>  .../{python3-dateutil_2.4.2.bb => python3-dateutil_2.5.1.bb}   |  0
>  .../python/{python3-lxml_3.5.0.bb => python3-lxml_3.6.0.bb}    |  0
>  .../python/{python-pymisp_2.2.bb => python3-pymisp_2.3.bb}     |  2 +-
>  .../{python3-pymongo_3.2.bb => python3-pymongo_3.2.2.bb}       |  0
>  .../{python3-werkzeug_0.11.3.bb => python3-werkzeug_0.11.5.bb} |  0
>  .../{python3-whoosh_2.7.0.bb => python3-whoosh_2.7.3.bb}       |  0
>  49 files changed, 93 insertions(+), 102 deletions(-)
>  rename meta-python/recipes-devtools/python/{
> python-certifi_2015.11.20.1.bb => python-certifi_2016.2.28.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-cffi_1.3.1.bb =>
> python-cffi_1.5.2.bb} (63%)
>  rename meta-python/recipes-devtools/python/{python-cmd2_0.6.7.bb =>
> python-cmd2_0.6.8.bb} (66%)
>  rename meta-python/recipes-devtools/python/{python-cython_0.23.1.bb =>
> python-cython_0.23.4.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-daemonize_2.4.2.bb =>
> python-daemonize_2.4.6.bb} (72%)
>  rename meta-python/recipes-devtools/python/{python-dateutil_2.4.2.bb =>
> python-dateutil_2.5.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-evdev_0.5.0.bb =>
> python-evdev_0.6.0.bb} (50%)
>  rename meta-python/recipes-devtools/python/{python-html5lib_0.999.bb =>
> python-html5lib_0.9999999.bb} (55%)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python-iso8601_0.1.10.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python-iso8601_0.1.11.bb
>  rename meta-python/recipes-devtools/python/{python-jsonpatch_1.12.bb =>
> python-jsonpatch_1.13.bb} (67%)
>  rename meta-python/recipes-devtools/python/{python-lxml_3.5.0.bb =>
> python-lxml_3.6.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-monotonic_0.6.bb =>
> python-monotonic_1.0.bb} (64%)
>  rename meta-python/recipes-devtools/python/{python-paste_2.0.2.bb =>
> python-paste_2.0.3.bb} (68%)
>  rename meta-python/recipes-devtools/python/{python-pep8_1.4.6.bb =>
> python-pep8_1.7.0.bb} (50%)
>  rename meta-python/recipes-devtools/python/{python-pip_7.1.2.bb =>
> python-pip_8.1.1.bb} (55%)
>  rename meta-python/recipes-devtools/python/{python-psutil_2.2.1.bb =>
> python-psutil_4.1.0.bb} (63%)
>  rename meta-python/recipes-devtools/python/{python-py_1.4.26.bb =>
> python-py_1.4.31.bb} (58%)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python-pycparser_2.10.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pycparser_2.14.bb
>  rename meta-python/recipes-devtools/python/{python-pyflakes_1.0.0.bb =>
> python-pyflakes_1.1.0.bb} (51%)
>  rename meta-python/recipes-devtools/python/{python3-pymisp_2.2.bb =>
> python-pymisp_2.3.bb} (52%)
>  rename meta-python/recipes-devtools/python/{python-pymongo_3.2.bb =>
> python-pymongo_3.2.2.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-pyparsing_2.0.3.bb =>
> python-pyparsing_2.1.1.bb} (60%)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python-pytest_2.7.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pytest_2.9.1.bb
>  rename meta-python/recipes-devtools/python/{python-pytz_2015.4.bb =>
> python-pytz_2016.3.bb} (67%)
>  rename meta-python/recipes-devtools/python/{python-pyudev_0.16.1.bb =>
> python-pyudev_0.19.0.bb} (73%)
>  rename meta-python/recipes-devtools/python/{python-pyyaml_3.10.bb =>
> python-pyyaml_3.11.bb} (78%)
>  rename meta-python/recipes-devtools/python/{python-sparts_0.7.2.bb =>
> python-sparts_0.7.3.bb} (76%)
>  rename meta-python/recipes-devtools/python/{python-urllib3_1.10.1.bb =>
> python-urllib3_1.14.bb} (51%)
>  rename meta-python/recipes-devtools/python/{python-werkzeug_0.11.3.bb =>
> python-werkzeug_0.11.5.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-whoosh_2.7.0.bb =>
> python-whoosh_2.7.3.bb} (100%)
>  rename meta-python/recipes-devtools/python/{
> python3-certifi_2015.11.20.1.bb => python3-certifi_2016.2.28.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-cython_0.23.1.bb =>
> python3-cython_0.23.4.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-dateutil_2.4.2.bb =>
> python3-dateutil_2.5.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-lxml_3.5.0.bb =>
> python3-lxml_3.6.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python-pymisp_2.2.bb =>
> python3-pymisp_2.3.bb} (50%)
>  rename meta-python/recipes-devtools/python/{python3-pymongo_3.2.bb =>
> python3-pymongo_3.2.2.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-werkzeug_0.11.3.bb
> => python3-werkzeug_0.11.5.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-whoosh_2.7.0.bb =>
> python3-whoosh_2.7.3.bb} (100%)
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

