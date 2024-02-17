Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB136C48BF5
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:02 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.569.1708128961178916264
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z7/gWn8E;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e10d08cb4fso2160213b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128960; x=1708733760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVSR5XBuqErJqJ9eh3BiIbhckiy135W51P9QKqKSP6I=;
        b=Z7/gWn8Eh/z1lih2oX9phQmfYOAbc+whPqEK/2+XDxgC3mnM40Lf4wTLqcCs50WnQF
         9uhWhv7BMOmU8PF7jE2O6AVADHAP8a2tRxFowvluqLqDgnTXDvFhiSTvylYFEs7OMKBR
         Z45lzUJjWhTPa9iAre9b0q9OqqRaWD88HfiTwpfdxdXXx7YOzNDkCL/O+jh6/bRTT8Qi
         vkkGh8QSWR8H5RGcZQSem2Tu7lY36oi+Qk95U/YCTxb88hVCD3rfLKmNCyM0y2cekJW9
         GyrVgdIMUTgokNdzLdXfgGaj447haizH2LMEX6H38SZqmJxawRRtLJGEO2Em0ZQHD3Ch
         9LbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128960; x=1708733760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVSR5XBuqErJqJ9eh3BiIbhckiy135W51P9QKqKSP6I=;
        b=uAy2u4ZVqVwXE8l9kEdyVAog8ULWVu6uXHEVV58sVzu4DiJB60+Y9IB8gJLT3AmAu8
         uYvEfvGejd1WFTZEffleGrMW4t6NTCXZySwmG/o7aJl8qZ185waxrKbKxS76CtNryYs3
         FfZhzzrOlAk1CoBzCFN74aMzaHvr1GwZhT9pKAwRMV68BIDXfrkg4J5LAOwWJYV0DIBK
         Tk2RKXNgsFJaqqGImQSt8fsmxbvUvbhej4jID/8vQC0+9+QCPsc+odxumv+zeeQFKFfU
         moIH6BKBJxXYxXB3VwhFlXFRJAyddneDVlyw+pVOfZx5Tgo5FuW3VPum6OzhCwzVyBKo
         fotA==
X-Gm-Message-State: AOJu0Yy0RRLahdygsZg9+vZ8A8qg+q7ZKkJsTCDZh6aVL4//7pSzg+kA
	qjjl0gnuWQFi6vqQgsfWNRf08ywCEufJzjiI4mZwtAl511xJkvHQcq8uyxn4
X-Google-Smtp-Source: AGHT+IGjluZiBrO8ZQtJCtsunniwn7X5P1Z2Q7BOofSE53dG4LfIjtL8KrVG9EY4TgmvYObDITHQnQ==
X-Received: by 2002:a05:6a20:93a2:b0:19e:5dda:6bd with SMTP id x34-20020a056a2093a200b0019e5dda06bdmr10058678pzh.8.1708128959910;
        Fri, 16 Feb 2024 16:15:59 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.15.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:15:59 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 00/60] Rework all pytest usage to use --automake and PYTHON_PN -> python3
Date: Fri, 16 Feb 2024 16:14:51 -0800
Message-Id: <cover.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108770

We have long been copy-pasting the
"pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'..."
into run-ptest to make the result output conformant.

The time for this is now long gone, thanks to the "pytest --automake" option using the
python3-unittest-automake-output plugin.

We also no longer need to worry about multiple versions of python, so for all recipes touched here we
also drop the ${PYTHON_PN} in favor of the much more readable "python3". If python4 becomes a thing,
we can revisit this.

I chose to make this series individual commits per recipe, because it was not a universal approach to every
recipe.

Most of the heavy lifting of this series was done by a script:
$ cat python-ptest-cleanup.sh
#!/bin/bash
meta_python_python_pn=$(grep -l -R '\${PYTHON_PN}' meta-python | tr '\n' ' ')
meta_python_run_ptest_pytest=$(grep -l -R "pytest -o" meta-python | tr '\n' ' ')
#meta_python_ptest_recipes=$(bitbake-layers show-recipes --recipes-only --layer meta-python --inherits ptest --bare | tr '\n' ' ' |
#pcregrep -o1 '^NOTE:.+===(.+)$')

for runptest in $meta_python_run_ptest_pytest ; do
  echo "BEFORE:"
  cat $runptest
  sed -i -e 's!-o log_cli=true -o log_cli_level=INFO | sed.*!--automake!g' $runptest
  git diff
  recipe=${runptest::-10}
  recipe_file=${recipe}'_*.bb'
  sed -i -e 's~\${PYTHON_PN}~python3~g' $(find meta-python -wholename $recipe_file)
  git diff
  vim $recipe_file
  if [[ $(git diff) =~ PYTHON_PN ]]; then
    git commit -s -a -m $(basename ${recipe})': switch to pytest --automake' -m '* Also replace ${PYTHON_PN} with python3'
  else
    git commit -s -a -m $(basename ${recipe})': switch to pytest --automake'
  fi
  git show
  exit
done

Overall, ignoring the recipes in PTESTS_PROBLEMS_META_PYTHON
(meta-openembedded/meta-python/conf/include/ptest-packagelists-meta-python.inc) the results are:

==============================================================================================================
qemux86-64 PTest Result Summary
==============================================================================================================
--------------------------------------------------------------------------------------------------------------
Recipe                    | Passed       | Failed | Skipped   | Time(s)
--------------------------------------------------------------------------------------------------------------
python3-ansicolors        | 22           | 0      | 1         | 1
python3-appdirs           | 6            | 0      | 0         | 1
python3-asgiref           | 29           | 0      | 36        | 4
python3-aspectlib         | 143          | 0      | 0         | 1
python3-blinker           | 31           | 0      | 1         | 1
python3-cachetools        | 201          | 0      | 0         | 0
python3-cbor2             | 662          | 0      | 0         | 5
python3-dominate          | 65           | 0      | 0         | 0
python3-execnet           | 283          | 0      | 563       | 21
python3-geojson           | 68           | 0      | 0         | 1
python3-html2text         | 168          | 0      | 0         | 4
python3-inflection        | 455          | 0      | 0         | 0
python3-intervals         | 57           | 0      | 0         | 1
python3-ipy               | 80           | 0      | 0         | 1
python3-iso3166           | 15           | 0      | 0         | 0
python3-lz4               | 19803        | 0      | 1         | 78
python3-multidict         | 840          | 0      | 2         | 1
python3-parse-type        | 222          | 0      | 0         | 0
python3-platformdirs      | 430          | 0      | 36        | 1
python3-polyline          | 17           | 0      | 0         | 4
python3-precise-runner    | 2            | 0      | 0         | 1
python3-prettytable       | 0            | 0      | 0         | 1
python3-ptyprocess        | 12           | 0      | 2         | 4
python3-py-cpuinfo        | 154          | 0      | 5         | 14
python3-pyasn1-modules    | 282          | 0      | 0         | 3
python3-pydantic          | 4100         | 8      | 145       | 17
python3-pydantic-core     | 3978         | 3      | 62        | 12
python3-pylint            | 805          | 0      | 38        | 38
python3-pyroute2          | 103          | 0      | 0         | 1
python3-pyserial          | 38           | 0      | 8         | 10
python3-pytest-mock       | 60           | 0      | 4         | 3
python3-pytoml            | 9            | 0      | 0         | 1
python3-pyyaml-include    | 54           | 0      | 0         | 1
python3-rapidjson         | 915          | 0      | 17        | 3
python3-requests-file     | 9            | 0      | 2         | 0
python3-requests-toolbelt | 137          | 0      | 5         | 1
python3-semver            | 328          | 0      | 0         | 1
python3-serpent           | 78           | 0      | 2         | 0
python3-simpleeval        | 95           | 0      | 0         | 1
python3-smpplib           | 15           | 0      | 0         | 0
python3-soupsieve         | 378          | 0      | 0         | 2
python3-sqlparse          | 423          | 0      | 0         | 2
python3-tomlkit           | 1706         | 0      | 0         | 5
python3-u-msgpack-python  | 26           | 0      | 0         | 1
python3-ujson             | 291          | 0      | 0         | 1
python3-unidiff           | 88           | 0      | 0         | 1
python3-uritemplate       | 122          | 0      | 0         | 1
python3-xmltodict         | 58           | 0      | 0         | 0
python3-xxhash            | 4            | 0      | 0         | 1
python3-yappi             | 98           | 0      | 0         | 44
python3-yarl              | 2212         | 0      | 0         | 1
--------------------------------------------------------------------------------------------------------------

==============================================================================================================
Failed test cases (sorted by testseries, ID)
==============================================================================================================
--------------------------------------------------------------------------------------------------------------
testseries | result_id : oeqa | runtime_meta-python-image-ptest-python3-pydantic-core_qemux86-64_20240216220350
    ptestresult.python3-pydantic-core.tests/validators/test_model.py:test_model_class_root_validator_after
    ptestresult.python3-pydantic-core.tests/validators/test_model.py:test_model_class_root_validator_before
    ptestresult.python3-pydantic-core.tests/validators/test_model.py:test_model_class_root_validator_wrap
testseries | result_id : oeqa | runtime_meta-python-image-ptest-python3-pydantic_qemux86-64_20240216220122
    ptestresult.python3-pydantic.tests/test_config.py:test_config_validation_error_cause
    ptestresult.python3-pydantic.tests/test_dataclasses.py:test_dataclass_config_validate_default
    ptestresult.python3-pydantic.tests/test_validators.py:test_annotated_validator_nested
    ptestresult.python3-pydantic.tests/test_validators.py:test_assert_raises_validation_error
    ptestresult.python3-pydantic.tests/test_validators.py:test_model_config_validate_default
    ptestresult.python3-pydantic.tests/test_validators.py:test_use_bare
    ptestresult.python3-pydantic.tests/test_validators.py:test_use_no_fields
    ptestresult.python3-pydantic.tests/test_validators.py:test_validator_bad_fields_throws_configerror
--------------------------------------------------------------------------------------------------------------


I did not take the time to figure out what is going wrong in the python3-pydantic* recipes (help wanted!)

Also, PLEASE take a look at the PTESTS_PROBLEMS_META_PYTHON recipes and see if you can fix the issues.


This series is built on top of:
  poky-contrib timo/master-next/pytest-8
  meta-openembedded/master-next

The following changes since commit 086eeb45d4dd241bfccaa717cf34b2692c5cbb5f:

  python3-pybind11: Remove the Boost dependency (2024-02-16 09:28:34 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/ptest-pytest-automake
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/ptest-pytest-automake

Tim Orling (60):
  python3-uritemplate: switch to pytest --automake
  python3-unidiff: switch to pytest --automake
  python3-ujson: switch to pytest --automake
  python3-pytest-lazy-fixture: switch to pytest --automake
  python3-fastjsonschema: switch to pytest --automake
  python3-tomlkit: switch to pytest --automake
  python3-inotify: switch to pytest --automake
  python3-requests-file: switch to pytest --automake
  python3-covdefaults: switch to pytest --automake
  python3-dominate: switch to pytest --automake
  python3-scrypt: switch to pytest --automake
  python3-u-msgpack-python: switch to pytest --automake
  python3-iso3166: switch to pytest --automake
  python3-trustme: switch to pytest --automake
  python3-asgiref: switch to pytest --automake
  python3-html2text: switch to pytest --automake
  python3-pyasn1-modules: switch to pytest --automake
  python3-intervals: switch to pytest --automake
  python3-py-cpuinfo: switch to pytest --automake
  python3-backports-functools-lru-cache: drop folder
  python3-whoosh: switch to pytest --automake
  python3-xlrd: switch to pytest --automake
  python3-dnspython: switch to pytest --automake
  python3-prettytable: switch to pytest --automake
  python3-ptyprocess: switch to pytest --automake
  python3-gunicorn: switch to pytest --automake
  python3-pytest-mock: switch to pytest --automake
  python3-pyroute2: switch to pytest --automake
  python3-smpplib: switch to pytest --automake
  python3-pyzmq: switch to pytest --automake
  python3-multidict: switch to pytest --automake
  python3-geojson: switch to pytest --automake
  python3-serpent: switch to pytest --automake
  python3-soupsieve: switch to pytest --automake
  python3-requests-toolbelt: switch to pytest --automake
  python3-yarl: switch to pytest --automake
  python3-cbor2: switch to pytest --automake
  python3-ansicolors: switch to pytest --automake
  python3-ipy: switch to pytest --automake
  python3-sqlparse: switch to pytest --automake
  python3-precise-runner: switch to pytest --automake
  python3-parse-type: switch to pytest --automake
  python3-inflection: switch to pytest --automake
  python3-blinker: switch to pytest --automake
  python3-service-identity: switch to pytest --automake
  python3-cachetools: switch to pytest --automake
  python3-simpleeval: switch to pytest --automake
  python3-appdirs: switch to pytest --automake
  python3-pillow: switch to pytest --automake
  python3-semver: switch to pytest --automake
  python3-platformdirs: switch to pytest --automake
  python3-polyline: switch to pytest --automake
  python3-betamax: switch to pytest --automake
  python3-pytoml: switch to pytest --automake
  python3-pyserial: switch to pytest --automake
  python3-typeguard: switch to pytest --automake
  python3-execnet: switch to pytest --automake
  python3-pyyaml-include: switch to pytest --automake
  python3-xxhash: switch to pytest --automake
  python3-pylint: switch to pytest --automake

 .../python/python3-ansicolors/run-ptest       |  2 +-
 .../python/python3-ansicolors_1.1.8.bb        |  3 +-
 .../python/python3-appdirs/run-ptest          |  2 +-
 .../python/python3-appdirs_1.4.4.bb           |  3 +-
 .../python/python3-asgiref/run-ptest          |  2 +-
 .../python/python3-asgiref_3.7.2.bb           |  9 +--
 .../run-ptest                                 |  3 -
 .../python/python3-betamax/run-ptest          |  2 +-
 .../python/python3-betamax_0.8.1.bb           |  3 +-
 .../python/python3-blinker/run-ptest          |  2 +-
 .../python/python3-blinker_1.7.0.bb           |  5 +-
 .../python/python3-cachetools/run-ptest       |  2 +-
 .../python/python3-cachetools_5.3.2.bb        |  5 +-
 .../python/python3-cbor2/run-ptest            |  2 +-
 .../python/python3-cbor2_5.6.1.bb             | 13 +++--
 .../python/python3-covdefaults/run-ptest      |  2 +-
 .../python/python3-covdefaults_2.3.0.bb       |  5 +-
 .../python/python3-dnspython/run-ptest        |  2 +-
 .../python/python3-dnspython_2.5.0.bb         | 19 ++++---
 .../python/python3-dominate/run-ptest         |  2 +-
 .../python/python3-dominate_2.9.1.bb          |  7 ++-
 .../python/python3-execnet/run-ptest          |  2 +-
 .../python/python3-execnet_2.0.2.bb           |  1 +
 .../python/python3-fastjsonschema/run-ptest   |  2 +-
 .../python/python3-fastjsonschema_2.18.0.bb   |  1 +
 .../python/python3-geojson/run-ptest          |  2 +-
 .../python/python3-geojson_3.1.0.bb           |  3 +-
 .../python/python3-gunicorn/run-ptest         |  2 +-
 .../python/python3-gunicorn_21.2.0.bb         |  9 +--
 .../python/python3-html2text/run-ptest        |  2 +-
 .../python/python3-html2text_2020.1.16.bb     |  3 +-
 .../python/python3-inflection/run-ptest       |  2 +-
 .../python/python3-inflection_0.5.1.bb        |  7 ++-
 .../python/python3-inotify/run-ptest          |  2 +-
 .../python/python3-inotify_git.bb             |  3 +-
 .../python/python3-intervals/run-ptest        |  2 +-
 .../python/python3-intervals_1.10.0.bb        |  3 +-
 .../python/python3-ipy/run-ptest              |  2 +-
 .../python/python3-ipy_1.01.bb                |  3 +-
 .../python/python3-iso3166/run-ptest          |  2 +-
 .../python/python3-iso3166_2.1.1.bb           |  3 +-
 .../python/python3-multidict/run-ptest        |  2 +-
 .../python/python3-multidict_6.0.4.bb         |  5 +-
 .../python/python3-parse-type/run-ptest       |  2 +-
 .../python/python3-parse-type_0.6.2.bb        |  5 +-
 .../python/python3-pillow/run-ptest           |  2 +-
 .../python/python3-pillow_10.1.0.bb           | 21 +++----
 .../python/python3-platformdirs/run-ptest     |  2 +-
 .../python/python3-platformdirs_4.2.0.bb      | 13 +++--
 .../python/python3-polyline/run-ptest         |  2 +-
 .../python/python3-polyline_2.0.1.bb          |  3 +-
 .../python/python3-precise-runner/run-ptest   |  2 +-
 .../python/python3-precise-runner_0.3.1.bb    |  3 +-
 .../python/python3-prettytable/run-ptest      |  2 +-
 .../python/python3-prettytable_3.9.0.bb       | 21 +++----
 .../python/python3-ptyprocess/run-ptest       |  4 +-
 .../python/python3-ptyprocess_0.7.0.bb        | 19 ++++---
 .../python/python3-py-cpuinfo/run-ptest       |  2 +-
 .../python/python3-py-cpuinfo_9.0.0.bb        |  3 +-
 .../python/python3-pyasn1-modules/run-ptest   |  2 +-
 .../python/python3-pyasn1-modules_0.3.0.bb    |  5 +-
 .../python/python3-pylint/run-ptest           |  2 +-
 .../python/python3-pylint_3.0.3.bb            | 56 ++++++++++---------
 .../python/python3-pyroute2/run-ptest         |  2 +-
 .../python/python3-pyroute2_0.7.10.bb         |  3 +-
 .../python/python3-pyserial/run-ptest         |  2 +-
 .../python/python3-pyserial_3.5.bb            | 19 ++++---
 .../python3-pytest-lazy-fixture/run-ptest     |  2 +-
 .../python3-pytest-lazy-fixture_0.6.3.bb      |  5 +-
 .../python/python3-pytest-mock/run-ptest      |  2 +-
 .../python/python3-pytest-mock_3.12.0.bb      |  3 +-
 .../python/python3-pytoml/run-ptest           |  2 +-
 .../python/python3-pytoml_0.1.21.bb           |  7 ++-
 .../python/python3-pyyaml-include/run-ptest   |  2 +-
 .../python/python3-pyyaml-include_1.3.2.bb    |  7 ++-
 .../python/python3-pyzmq/run-ptest            |  2 +-
 .../python/python3-pyzmq_25.1.2.bb            |  9 +--
 .../python/python3-requests-file/run-ptest    |  2 +-
 .../python/python3-requests-file_1.5.1.bb     |  3 +-
 .../python3-requests-toolbelt/run-ptest       |  2 +-
 .../python/python3-requests-toolbelt_1.0.0.bb | 13 +++--
 .../python/python3-scrypt/run-ptest           |  2 +-
 .../python/python3-scrypt_0.8.20.bb           |  5 +-
 .../python/python3-semver/run-ptest           |  2 +-
 .../python/python3-semver_3.0.2.bb            |  3 +-
 .../python/python3-serpent/run-ptest          |  2 +-
 .../python/python3-serpent_1.41.bb            | 11 ++--
 .../python/python3-service-identity/run-ptest |  2 +-
 .../python/python3-service-identity_21.1.0.bb |  3 +-
 .../python/python3-simpleeval/run-ptest       |  2 +-
 .../python/python3-simpleeval_0.9.13.bb       |  5 +-
 .../python/python3-smpplib/run-ptest          |  2 +-
 .../python/python3-smpplib_2.2.3.bb           | 13 +++--
 .../python/python3-soupsieve/run-ptest        |  2 +-
 .../python/python3-soupsieve_2.5.bb           |  5 +-
 .../python/python3-sqlparse/run-ptest         |  2 +-
 .../python/python3-sqlparse_0.4.4.bb          |  5 +-
 .../python/python3-tomlkit/run-ptest          |  2 +-
 .../python/python3-tomlkit_0.12.3.bb          |  7 ++-
 .../python/python3-trustme/run-ptest          |  2 +-
 .../python/python3-trustme_1.1.0.bb           |  7 ++-
 .../python/python3-typeguard/run-ptest        |  2 +-
 .../python/python3-typeguard_4.1.5.bb         |  7 ++-
 .../python/python3-u-msgpack-python/run-ptest |  2 +-
 .../python/python3-u-msgpack-python_2.8.0.bb  |  5 +-
 .../python/python3-ujson/run-ptest            |  2 +-
 .../python/python3-ujson_5.9.0.bb             | 13 +++--
 .../python/python3-unidiff/run-ptest          |  2 +-
 .../python/python3-unidiff_0.7.5.bb           |  7 ++-
 .../python/python3-uritemplate/run-ptest      |  2 +-
 .../python/python3-uritemplate_4.1.1.bb       |  3 +-
 .../python/python3-whoosh/run-ptest           |  2 +-
 .../python/python3-whoosh_2.7.4.bb            | 19 ++++---
 .../python/python3-xlrd/run-ptest             |  2 +-
 .../python/python3-xlrd_2.0.1.bb              |  1 +
 .../python/python3-xxhash/run-ptest           |  2 +-
 .../python/python3-xxhash_3.4.1.bb            |  3 +-
 .../python/python3-yarl/run-ptest             |  2 +-
 .../python/python3-yarl_1.9.4.bb              | 13 +++--
 119 files changed, 324 insertions(+), 265 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-backports-functools-lru-cache/run-ptest

-- 
2.34.1


