Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.71])
 by mx.groups.io with SMTP id smtpd.web11.3370.1599675921466335633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 11:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CkRzbJsM;
 spf=pass (domain: windriver.com, ip: 40.107.69.71, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGUkRrawD0Yb2U94xYL9U+eYA9k6u4bA8kem0wEdW+ZYWkar/sOq2Gq4MpbxkYOZ9l1JvtD7jHSw+kz/nFPtfapufVi0PycjOoU52fV0Fman/TOAdqf8m8Lg/HhZlDGPLruX90torYfLf2hyLAFdpRewvxQNiide1gw1McFSsBomEvw7G6kRsDZoF5rKrIqL6YAqfhCMW9iawAoXV3j4CMhOfsGI6TLsN815M1+QCMf6jqkhI8exXF42TVlWb3SYA5BF7qNxFpBi+3QpjFngUfc2Y4DNvB/BbzGd8mtSucOzkRs2/lpQnrVSH1Du4Z3xbnhDHUXxVFyMpcM6RGVOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOueovFdaJQbGiw0T5JSog4oxZH/2/JJ0X6lasF4bY0=;
 b=BpNi7FOJtiFuv9nnd6HAzJdLndjomSOPLrKR0KidALy1v8/lohWfDjqns+tN9VFJh4hr122HW+u6PQyVrrq3daRnfMBv+615HYTcdYQYHkL1h1sn9CWVeG0DGF9bg4fgdNp3iQnYuuhq5/OTmuboaWltTFaBM04ecYHGwY1JZzRJzM4tLjVeGicBPp1ayCQ+IMQBbvK8VJ5/KgW3ldJNLBTQ9aKBJmF2NJaVMElZ/V6Qr5tgUYR/mmcErSXGMqVAektK72NmLwvoamShutyCqYwK0rNTN2mtc00ozcN0tsofCCtjkdfDR9Rb8uOrHZAdQ0QCDw4N08L8oYaScqCzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOueovFdaJQbGiw0T5JSog4oxZH/2/JJ0X6lasF4bY0=;
 b=CkRzbJsMTolCyNllt6YJUHBvprLTKMkvwkqQCDNfcHhb4oEFZnLiDBhLohNowFKrhUxu88DiHK2icQPy0ADUF7pKqOZmonFQayivKji4IHRu/69pklzvbE4wDOJQpS7lKifUKA3e2NcUAUiwJbM9gxD8EI+S39PbtB5rRXLAeTM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 9 Sep
 2020 18:25:13 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 18:25:13 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] packagegroup-meta-python: Add new packages
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200902191231.1224543-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3870f31c-47ce-b60f-04b9-c4b4295e42f4@windriver.com>
Date: Wed, 9 Sep 2020 14:25:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902191231.1224543-1-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 18:25:12 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e57a6aa-0ed9-466e-523e-08d854edb135
X-MS-TrafficTypeDiagnostic: BY5PR11MB3912:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB391284796AD3DE60E0783C139F260@BY5PR11MB3912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t3czvU6OZXE+a9om+sxxUJ0HoFXsE1HDR29VptqvQ40uRXLL0mt/SHDQtifxOIbbENWGkWvPH08blnWjLgQxM6Fyv0yu2kS0JRrYoJNl3K2ijMTClSKgi9TdHpn1fFrtC5K1w4BJ72tTJspa5ipzNnajRUasLN5hlEQVcFbkjQoFsJjpZ5ErBbXOJOw+s0wRIdDQdBo9JTup+6zgtbtVNv+6m7g7MxymqyYUE6nSw5sLX3lN/sflJjKgsAdm3bJsizvYhFtni1aepzjlCMwBx9ApcVPUrAR3L57rQuggM0cbzVDW8I1Dd3+IHMR8yGD/X/LbxBYmfGHF1GXoQIXUoAA9bvykldSwss56+yhMTtzmlENCEIWkRa57QdvlvnZeGPhNve4EXsAp07d5k1mU9degNMdUWzUqPV7TAJ3f3RVmvTz4Jq6gk1uiFiUeNog6Pl8CMV1CGYICKxXp9mtTAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(39850400004)(396003)(83380400001)(956004)(2616005)(16576012)(8936002)(36756003)(478600001)(44832011)(6486002)(316002)(8676002)(31686004)(53546011)(966005)(2906002)(186003)(16526019)(66556008)(66946007)(31696002)(26005)(5660300002)(52116002)(166002)(66476007)(30864003)(33964004)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9chOWNxu6NcHWnASCeuDc9iNv+TmT4yTXSiKpcrQs5BfDnuBUc6DWhUs9HqefjO61YJaVeev8oxcbzL63LJ1aZKQRzqPf8CQwjc3u5XqTxi7tnYv4bLg6U/WbZrz+vy2N28i2lgB0sgDnIyHtWOAjwzntQJrkzt0bi1IzKMNhYl2+zz64I8zenWcXt4ze9hZxHsTXWa7QDzqKF3Eb96cMptTUF28ZHrEX7hWhi037SpV6WMMPne8mVBOpSd9QIGDWkief5DKxuQsWcY2gVFtubAnhXzKt1dPeQOsiBea4dyjM0DiVaKuywvk8RbT6dFvVJrtDea0XVuFvKFdaiiUN/ClAF2R5Qmbb7MP117+cDyg8LlEYrQ1wDqbRiiGCg/iKeISzZN12Ws86+Rii/VWxfeJtTdqvtG+tFFF+ZfdMx7uHlkYYWBXanrMARVxKfdgbV3Rq9Lwt5bmYXW7C9RQxR6Rp9eixnRp4+Wpk/YQf2WrSvk4E9sGEypWnvYgHHYRHx0jP3K7rvkCqx9klcZFY7pRXZM05n+w1O7HLWlx9knwx7M84ZeuFv3RA4wbENV1V4efSsCzIv14xr/HFtjxAm5Fc6MfVaMYfOgB1evWfUaTLHz53h88uQgFMR17OstCHdqSULg05x/9KOzKA8wdHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e57a6aa-0ed9-466e-523e-08d854edb135
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 18:25:13.3347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFFbILadWrq1VIoznMSJpsyHPfPvKQ6wnGwJkfKxB1DIz2SHyzWRmvdwsr+VBwOmID0oEYKluessK3j80ItXZywGSAfY6psWEEUZwKpj1jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3912
Content-Type: multipart/alternative;
 boundary="------------CFA513D4AA48A9213C037F83"
Content-Language: en-US

--------------CFA513D4AA48A9213C037F83
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 3:12 PM, Khem Raj wrote:
> Reorganise entries per line
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb | 470 ++++++++++++++++--
>   1 file changed, 428 insertions(+), 42 deletions(-)
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index c03f610da8..0aea30e330 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -1,10 +1,11 @@
> -SUMMARY = "Meta-oe ptest packagegroups"
> +SUMMARY = "Meta-python ptest packagegroups"
>   
>   inherit packagegroup
>   
>   PROVIDES = "${PACKAGES}"
>   PACKAGES = ' \
>       packagegroup-meta-python3 \
> +    packagegroup-meta-python3-ptest \
>   '
>   
>   RDEPENDS_packagegroup-meta-python3 = "\
> @@ -13,58 +14,443 @@ RDEPENDS_packagegroup-meta-python3 = "\
>   "
>   
>   RDEPENDS_packagegroup-meta-python3 = "\
> -    python3-pyserial python3-gevent python3-alembic python3-robotframework-seriallibrary \
> -    python3-rfc3987 python3-xlrd python3-bandit python3-constantly python3-inflection \
> -    python3-javaobj-py3 python3-sh python3-pycrypto python3-pyasn1 python3-pydbus python3-wtforms \
> -    python3-pybluez python3-babel python3-parse-type python3-bitarray python3-django-south \
> -    python3-pyusb python3-prctl python3-jinja2 python3-werkzeug python3-pyjks python3-requests-ftp \
> -    python3-behave python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
> -    python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
> -    python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
> -    python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
> -    python3-flask-script python3-cassandra-driver python3-ujson python3-aws-iot-device-sdk-python \
> -    python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
> -    python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
> -    python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
> -    python3-urllib3 python3-flask-mail python3-asn1crypto python3-pyinotify python3-intervals python3-pyperclip \
> -    python3-flask-bootstrap python3-pyudev python3-decorator python3-pybind11 python3-pluggy python3-redis \
> -    python3-pycryptodome python3-passlib python3-dominate python3-ply python3-ntplib python3-serpent python3-wrapt \
> -    python3-attrs python3-appdirs python3-isort python3-evdev python3-incremental python3-click python3-flask-nav \
> -    python3-webcolors python3-dateutil python3-blinker python3-hyperlink python3-lxml python3-pylint \
> -    python3-flask-migrate python3-pytest-tempdir python3-flask-restful python3-feedformatter \
> -    python3-pyasn1-modules python3-scapy python3-html5lib python3-dnspython python3-automat \
> -    python3-itsdangerous python3-pandas python3-pyfirmata python3-protobuf  \
> -    python3-flask-babel python3-anyjson python3-flask-xstatic python3-multidict python3-prompt-toolkit \
> -    python3-periphery python3-greenlet python3-pytz python3-pyexpect python3-zopeinterface \
> -    python3-bcrypt python3-xstatic-font-awesome python3-m2crypto python3-parse python3-attr \
> -    python3-beautifulsoup4 python3-pycodestyle python3-oauthlib python3-grpcio python3-scrypt \
> -    python3-pyjwt python3-astroid python3-flask-pymongo python3-wcwidth python3-lazy-object-proxy \
> -    python3-websockets python3-pyzmq python3-pytest python3-chardet python3-vcversioner python3-whoosh \
> -    python3-pymisp python3-certifi python3-psutil python3-flask-sqlalchemy python3-humanize \
> -    python3-grpcio-tools python3-configparser python3-strict-rfc3339 python3-paho-mqtt \
> -    python3-pytest-helpers-namespace python3-flask python3-flask-wtf python3-visitor python3-pynetlinux \
> -    python3-requests python3-cryptography-vectors python3-spidev python3-pid python3-pymongo \
> -    python3-future python3-django python3-unidiff python3-webencodings python3-can python3-pyalsaaudio \
> -    python3-flask-sijax python3-cryptography python3-twisted python3-netaddr python3-pycparser \
> -    python3-flask-uploads python3-pysocks python3-cffi python3-editor python3-ptyprocess \
> -    python3-pyopenssl python3-ordered-set python3-simplejson python3-py \
> +    pamela \
> +    pyrtm \
>       ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
> +    python3-bcrypt \
> +    python3-flask-mail \
> +    python3-editor \
> +    python3-flask-pymongo \
> +    python3-cffi \
> +    python3-pillow \
> +    python3-markupsafe \
> +    python3-flask-nav \
> +    python3-asciitree \
> +    python3-flask-sqlalchemy \
> +    python3-gevent \
> +    python3-attrs \
> +    python3-aenum \
> +    python3-gast \
> +    python3-blinker \
> +    python3-prettytable \
> +    python3-cmd2 \
> +    python3-aiofiles \
> +    python3-anyjson \
> +    python3-isodate \
> +    python3-incremental \
> +    python3-aiohttp-jinja2 \
> +    python3-aiohttp \
> +    python3-alembic \
> +    python3-ansi2html \
> +    python3-ansicolors \
> +    python3-argexec \
> +    python3-appdirs \
> +    python3-apply-defaults \
> +    python3-argh \
> +    python3-ply \
> +    python3-astroid \
> +    python3-ndg-httpsclient \
> +    python3-arpeggio \
> +    python3-astor \
> +    python3-pika \
> +    python3-asn1crypto \
> +    python3-async-timeout \
> +    python3-absl \
> +    python3-atomicwrites \
> +    python3-attr \
> +    python3-flask \
> +    python3-autobahn \
> +    python3-babel \
> +    python3-pretend \
> +    python3-automat \
> +    python3-ptyprocess \
> +    python3-aws-iot-device-sdk-python \
> +    python3-bandit \
> +    python3-backcall \
> +    python3-backports-functools-lru-cache \
> +    python3-beautifulsoup4 \
> +    python3-betamax \
> +    python3-behave \
> +    python3-jsonpointer \
> +    python3-bitarray \
> +    python3-bitstring \
> +    python3-bitstruct \
> +    python3-cachecontrol \
> +    python3-booleanpy \
> +    python3-cachetools \
> +    python3-can \
> +    python3-cantools \
> +    python3-cassandra-driver \
> +    python3-cbor2 \
> +    python3-chardet \
> +    python3-certifi \
> +    python3-isort \
> +    python3-colorama \
> +    python3-cheetah \
> +    python3-click \
> +    python3-huey \
> +    python3-coloredlogs \
> +    python3-colorlog \
> +    python3-wheel \
> +    python3-configshell-fb \
> +    python3-constantly \
> +    python3-contextlib2 \
> +    python3-configargparse \
> +    python3-crcmod \
> +    python3-configobj \
> +    python3-configparser \
> +    python3-cppy \
> +    python3-dbussy \
> +    python3-dateutil \
> +    python3-distro \
> +    python3-click-repl \
> +    python3-redis \
> +    python3-dominate \
> +    python3-et-xmlfile \
> +    python3-feedformatter \
> +    python3-flask-jsonpify \
> +    python3-flask-jwt \
> +    python3-flask-migrate \
> +    python3-pyinotify \
> +    python3-flask-restful \
> +    python3-flask-socketio \
> +    python3-gmqtt \
> +    python3-dateparser \
> +    python3-defusedxml \
> +    python3-rsa \
> +    python3-django-south \
> +    python3-grpcio \
> +    python3-pybind11-json \
> +    python3-google-api-python-client \
> +    python3-h5py \
> +    python3-dt-schema \
> +    python3-haversine \
> +    python3-fasteners \
> +    python3-flask-bootstrap \
> +    python3-dbus-next \
> +    python3-dnspython \
> +    python3-traitlets \
> +    python3-pybind11 \
> +    python3-flask-script \
> +    python3-flask-sijax \
> +    python3-html2text \
> +    python3-html5lib \
> +    python3-intervals \
> +    python3-ipy \
> +    python3-ipaddress \
> +    python3-iso8601 \
> +    python3-humanfriendly \
> +    python3-lrparsing \
> +    python3-itsdangerous \
> +    python3-hyperlink \
> +    python3-idna-ssl \
> +    python3-jdcal \
> +    python3-greenstalk \
> +    python3-icu \
> +    python3-jsonschema \
> +    python3-keras-applications \
> +    python3-idna \
> +    python3-sympy \
> +    python3-importlib-metadata \
> +    python3-langtable \
> +    python3-lockfile \
> +    python3-nmap \
> +    python3-jdatetime \
> +    python3-monotonic \
> +    python3-mpmath \
> +    python3-jedi \
> +    python3-jsonpatch \
> +    python3-jsonrpcserver \
> +    python3-libconf \
> +    python3-netifaces \
> +    python3-msm \
> +    python3-nocaselist \
> +    python3-keras-preprocessing \
> +    python3-flask-babel \
> +    python3-lorem \
> +    python3-javaobj-py3 \
> +    python3-passlib \
> +    python3-pathlib2 \
> +    python3-pexpect \
> +    python3-luma-oled \
> +    python3-pluggy \
> +    python3-lxml \
> +    python3-precise-runner \
> +    python3-padaos \
> +    python3-progress \
> +    python3-sqlalchemy \
> +    python3-sh \
> +    python3-petact \
> +    python3-mock \
> +    python3-msgpack \
> +    python3-pyasn1 \
> +    python3-msk \
> +    python3-openpyxl \
> +    python3-prctl \
> +    python3-pyatspi \
> +    python3-multidict \
> +    python3-netaddr \
> +    python3-parse \
> +    python3-oauthlib \
> +    python3-pyfirmata \
> +    python3-pandas \
> +    python3-padatious \
> +    python3-prompt-toolkit \
> +    python3-parse-type \
> +    python3-cycler \
> +    python3-decorator \
> +    python3-django \
> +    python3-croniter \
> +    python3-flask-user \
> +    python3-twitter \
> +    python3-evdev \
> +    python3-dynamic-dispatch \
> +    python3-click-spinner \
> +    python3-future \
> +    python3-geojson \
> +    python3-gunicorn \
> +    python3-engineio \
> +    python3-gmpy2 \
> +    python3-coverage \
> +    python3-fastnumbers \
> +    python3-fann2 \
> +    python3-gnupg \
> +    python3-flask-login \
> +    python3-pyzmq \
> +    python3-cryptography-vectors \
> +    python3-flask-uploads \
> +    python3-ecdsa \
> +    python3-networkx \
> +    python3-flask-xstatic \
> +    python3-pint \
> +    python3-iso3166 \
> +    python3-imageio \
> +    python3-mccabe \
> +    python3-kconfiglib \
> +    python3-grpcio-tools \
> +    python3-jinja2 \
> +    python3-jsmin \
> +    python3-greenlet \
> +    python3-idna \
> +    python3-flask-versioned \
> +    python3-httplib2 \
> +    python3-ipython-genutils \
> +    python3-kiwisolver \
> +    python3-lz4 \
> +    python3-obd \
> +    python3-markdown \
> +    python3-m2crypto \
> +    python3-paho-mqtt \
> +    python3-graphviz \
> +    python3-pyaudio \
> +    python3-pako \
> +    python3-meld3 \
> +    python3-parallax \
> +    python3-lazy-object-proxy \
> +    python3-license-expression \
> +    python3-luma-core \
> +    python3-natsort \
> +    python3-polyline \
> +    python3-ordered-set \
> +    python3-packaging \
> +    python3-parso \
> +    python3-pycparser \
> +    python3-pycrypto \
> +    python3-pydbus \
> +    python3-pathtools3 \
> +    python3-periphery \
> +    python3-pyiface \
> +    python3-pyjwt \
> +    python3-pykwalify \
> +    python3-pylint \
> +    python3-pynetlinux \
> +    python3-pickleshare \
> +    python3-pyopenssl \
> +    python3-protobuf \
> +    python3-py \
> +    python3-pyasn1-modules \
> +    python3-pyscaffold \
> +    python3-pyserial \
> +    python3-pysocks \
> +    python3-pytoml \
> +    python3-pytest-helpers-namespace \
> +    python3-more-itertools \
> +    python3-pytest-tempdir \
> +    python3-pyflakes \
> +    python3-pyrad \
> +    python3-pyusb \
> +    python3-pyhamcrest \
> +    python3-custom-inherit \
> +    python3-pymysql \
> +    python3-pyperclip \
> +    python3-rfc3339-validator \
> +    python3-pytz \
> +    python3-scrypt \
> +    python3-rdflib \
> +    python3-sijax \
> +    python3-regex \
> +    python3-slip-dbus \
> +    python3-smbus2 \
> +    python3-pytest-metadata \
> +    python3-term \
> +    python3-pystache \
> +    python3-pep8 \
> +    python3-pytest-runner \
> +    python3-pybluez \
> +    python3-rfc3986-validator \
> +    python3-pocketsphinx \
> +    python3-sdnotify \
> +    python3-pycodestyle \
> +    python3-pytest \
> +    python3-speaklater \
> +    python3-wtforms \
> +    python3-speedtest-cli \
> +    python3-pyudev \
> +    python3-sqlparse \
> +    python3-pyexpect \
> +    python3-pytest-html \
> +    python3-uritemplate \
> +    python3-cryptography \
> +    python3-requests \
> +    python3-test-generator \
> +    python3-whoosh \
> +    python3-xstatic-font-awesome \
> +    python3-tqdm \
> +    python3-vcversioner \
> +    python3-semver \
> +    python3-serpent \
> +    python3-spidev \
> +    python3-sqlsoup \
> +    python3-tornado \
> +    python3-trafaret \
> +    python3-urllib3 \
> +    python3-yappi \
> +    python3-zipp \
> +    python3-texttable \
> +    python3-humanize \
> +    python3-strict-rfc3339 \
> +    python3-supervisor \
> +    python3-toml \
> +    python3-diskcache \
> +    python3-requests-futures \
> +    python3-matplotlib \
> +    python3-sentry-sdk \
> +    python3-xlrd \
> +    python3-xstatic \
> +    python3-tzlocal \
> +    python3-wcwidth \
> +    python3-ntplib \
> +    python3-u-msgpack-python \
> +    python3-python-vlc \
> +    python3-xlsxwriter \
> +    python3-inflection \
> +    python3-tabulate \
> +    python3-typing-extensions \
> +    python3-pystemd \
> +    python3-pid \
> +    python3-pkgconfig \
> +    python3-pylyrics \
> +    python3-pyyaml \
> +    python3-raven \
> +    python3-stevedore \
> +    python3-requests-oauthlib \
> +    python3-rfc3987 \
> +    python3-psutil \
> +    python3-robotframework-seriallibrary \
> +    python3-pulsectl \
> +    python3-py-ubjson \
> +    python3-pyalsaaudio \
> +    python3-simpleeval \
> +    python3-smbus \
> +    python3-pychromecast \
> +    python3-pyjks \
> +    python3-pymongo \
> +    python3-spidev \
> +    python3-pynacl \
> +    python3-termcolor \
> +    python3-pyperf \
> +    python3-qrcode \
> +    python3-visitor \
> +    python3-pyroute2 \
> +    python3-webencodings \
> +    python3-pyrsistent \
> +    python3-werkzeug \
> +    python3-pydicti \
> +    python3-xmlrunner \
> +    python3-smpplib \
> +    python3-pymisp \
> +    python3-requests-file \
> +    python3-requests-toolbelt \
> +    python3-ruamel-yaml \
> +    python3-setuptools-scm \
> +    python3-socketio \
> +    python3-soupsieve \
> +    python3-textparser \
> +    python3-tinyrecord \
> +    python3-twine \
> +    python3-unidiff \
> +    python3-watchdog \
> +    python3-webcolors \
> +    python3-robotframework \
> +    python3-xxhash \
> +    python3-yarl \
> +    python3-zopeinterface \
> +    python3-requests-ftp \
> +    python3-scapy \
> +    python3-paramiko \
> +    python3-twofish \
> +    python3-simplejson \
> +    python3-snappy \
> +    python3-versiontools \
> +    python3-flask-wtf \
> +    python3-websockets \
> +    python3-werkzeug \
> +    python3-wrapt \
> +    python3-xmltodict \
> +    python3-trafaret-config \
> +    python3-twisted \
> +    python3-txaio \
> +    python3-typeguard \
> +    python3-pytest-timeout \
> +    python3-ujson \
> +    python3-waitress \
> +    python3-websocket-client \
> +    python3-xmodem \
> +    python3-djangorestframework \
> +    python3-pytest-asyncio \
> +    python3-nocasedict \
> +    python3-yamlloader \
> +    python3-ipython \
> +    python3-pycurl \
> +    gyp \
> +    python3-jsonref \
>   "
>   
>   RDEPENDS_packagegroup-meta-python3-extended = "\
> -    python3-pykickstart \
> -    python3-meh \
>       python3-blivet \
> -    python3-pywbem \
> -    python3-pyparted \
>       ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
> +    python3-cson \
> +    python3-meh \
> +    python3-pyephem \
> +    python3-pykickstart \
> +    python3-pyparted \
> +    python3-pywbem \
> +    python3-pywbemtools \
>   "
>   
>   RDEPENDS_packagegroup-meta-python3-connectivity = "\
> -    python3-pytun \
> +    python3-gsocketpool \
> +    python3-h2 \
> +    python3-hpack \
> +    python3-hyperframe \
>       python3-mprpc \
> +    python3-priority \
>       python3-pyconnman \
> -    python3-gsocketpool \
> +    python3-pyro4 \
> +    python3-thrift \
> +    python3-txws \
> +    python3-pytun \
> +    telepathy-python3 \
>   "
>   
>   RDEPENDS_packagegroup-meta-python3-ptest = "\
>
> 

--------------CFA513D4AA48A9213C037F83
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 3:12 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902191231.1224543-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">Reorganise entries per line

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200902191231.1224543-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb | 470 ++++++++++++++++--
 1 file changed, 428 insertions(+), 42 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c03f610da8..0aea30e330 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -1,10 +1,11 @@
-SUMMARY = &quot;Meta-oe ptest packagegroups&quot;
+SUMMARY = &quot;Meta-python ptest packagegroups&quot;
 
 inherit packagegroup
 
 PROVIDES = &quot;${PACKAGES}&quot;
 PACKAGES = ' \
     packagegroup-meta-python3 \
+    packagegroup-meta-python3-ptest \
 '
 
 RDEPENDS_packagegroup-meta-python3 = &quot;\
@@ -13,58 +14,443 @@ RDEPENDS_packagegroup-meta-python3 = &quot;\
 &quot;
 
 RDEPENDS_packagegroup-meta-python3 = &quot;\
-    python3-pyserial python3-gevent python3-alembic python3-robotframework-seriallibrary \
-    python3-rfc3987 python3-xlrd python3-bandit python3-constantly python3-inflection \
-    python3-javaobj-py3 python3-sh python3-pycrypto python3-pyasn1 python3-pydbus python3-wtforms \
-    python3-pybluez python3-babel python3-parse-type python3-bitarray python3-django-south \
-    python3-pyusb python3-prctl python3-jinja2 python3-werkzeug python3-pyjks python3-requests-ftp \
-    python3-behave python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
-    python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
-    python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
-    python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
-    python3-flask-script python3-cassandra-driver python3-ujson python3-aws-iot-device-sdk-python \
-    python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
-    python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
-    python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
-    python3-urllib3 python3-flask-mail python3-asn1crypto python3-pyinotify python3-intervals python3-pyperclip \
-    python3-flask-bootstrap python3-pyudev python3-decorator python3-pybind11 python3-pluggy python3-redis \
-    python3-pycryptodome python3-passlib python3-dominate python3-ply python3-ntplib python3-serpent python3-wrapt \
-    python3-attrs python3-appdirs python3-isort python3-evdev python3-incremental python3-click python3-flask-nav \
-    python3-webcolors python3-dateutil python3-blinker python3-hyperlink python3-lxml python3-pylint \
-    python3-flask-migrate python3-pytest-tempdir python3-flask-restful python3-feedformatter \
-    python3-pyasn1-modules python3-scapy python3-html5lib python3-dnspython python3-automat \
-    python3-itsdangerous python3-pandas python3-pyfirmata python3-protobuf  \
-    python3-flask-babel python3-anyjson python3-flask-xstatic python3-multidict python3-prompt-toolkit \
-    python3-periphery python3-greenlet python3-pytz python3-pyexpect python3-zopeinterface \
-    python3-bcrypt python3-xstatic-font-awesome python3-m2crypto python3-parse python3-attr \
-    python3-beautifulsoup4 python3-pycodestyle python3-oauthlib python3-grpcio python3-scrypt \
-    python3-pyjwt python3-astroid python3-flask-pymongo python3-wcwidth python3-lazy-object-proxy \
-    python3-websockets python3-pyzmq python3-pytest python3-chardet python3-vcversioner python3-whoosh \
-    python3-pymisp python3-certifi python3-psutil python3-flask-sqlalchemy python3-humanize \
-    python3-grpcio-tools python3-configparser python3-strict-rfc3339 python3-paho-mqtt \
-    python3-pytest-helpers-namespace python3-flask python3-flask-wtf python3-visitor python3-pynetlinux \
-    python3-requests python3-cryptography-vectors python3-spidev python3-pid python3-pymongo \
-    python3-future python3-django python3-unidiff python3-webencodings python3-can python3-pyalsaaudio \
-    python3-flask-sijax python3-cryptography python3-twisted python3-netaddr python3-pycparser \
-    python3-flask-uploads python3-pysocks python3-cffi python3-editor python3-ptyprocess \
-    python3-pyopenssl python3-ordered-set python3-simplejson python3-py \
+    pamela \
+    pyrtm \
     ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;systemd&quot;, &quot;python3-systemd&quot;, &quot;&quot;, d)} \
+    python3-bcrypt \
+    python3-flask-mail \
+    python3-editor \
+    python3-flask-pymongo \
+    python3-cffi \
+    python3-pillow \
+    python3-markupsafe \
+    python3-flask-nav \
+    python3-asciitree \
+    python3-flask-sqlalchemy \
+    python3-gevent \
+    python3-attrs \
+    python3-aenum \
+    python3-gast \
+    python3-blinker \
+    python3-prettytable \
+    python3-cmd2 \
+    python3-aiofiles \
+    python3-anyjson \
+    python3-isodate \
+    python3-incremental \
+    python3-aiohttp-jinja2 \
+    python3-aiohttp \
+    python3-alembic \
+    python3-ansi2html \
+    python3-ansicolors \
+    python3-argexec \
+    python3-appdirs \
+    python3-apply-defaults \
+    python3-argh \
+    python3-ply \
+    python3-astroid \
+    python3-ndg-httpsclient \
+    python3-arpeggio \
+    python3-astor \
+    python3-pika \
+    python3-asn1crypto \
+    python3-async-timeout \
+    python3-absl \
+    python3-atomicwrites \
+    python3-attr \
+    python3-flask \
+    python3-autobahn \
+    python3-babel \
+    python3-pretend \
+    python3-automat \
+    python3-ptyprocess \
+    python3-aws-iot-device-sdk-python \
+    python3-bandit \
+    python3-backcall \
+    python3-backports-functools-lru-cache \
+    python3-beautifulsoup4 \
+    python3-betamax \
+    python3-behave \
+    python3-jsonpointer \
+    python3-bitarray \
+    python3-bitstring \
+    python3-bitstruct \
+    python3-cachecontrol \
+    python3-booleanpy \
+    python3-cachetools \
+    python3-can \
+    python3-cantools \
+    python3-cassandra-driver \
+    python3-cbor2 \
+    python3-chardet \
+    python3-certifi \
+    python3-isort \
+    python3-colorama \
+    python3-cheetah \
+    python3-click \
+    python3-huey \
+    python3-coloredlogs \
+    python3-colorlog \
+    python3-wheel \
+    python3-configshell-fb \
+    python3-constantly \
+    python3-contextlib2 \
+    python3-configargparse \
+    python3-crcmod \
+    python3-configobj \
+    python3-configparser \
+    python3-cppy \
+    python3-dbussy \
+    python3-dateutil \
+    python3-distro \
+    python3-click-repl \
+    python3-redis \
+    python3-dominate \
+    python3-et-xmlfile \
+    python3-feedformatter \
+    python3-flask-jsonpify \
+    python3-flask-jwt \
+    python3-flask-migrate \
+    python3-pyinotify \
+    python3-flask-restful \
+    python3-flask-socketio \
+    python3-gmqtt \
+    python3-dateparser \
+    python3-defusedxml \
+    python3-rsa \
+    python3-django-south \
+    python3-grpcio \
+    python3-pybind11-json \
+    python3-google-api-python-client \
+    python3-h5py \
+    python3-dt-schema \
+    python3-haversine \
+    python3-fasteners \
+    python3-flask-bootstrap \
+    python3-dbus-next \
+    python3-dnspython \
+    python3-traitlets \
+    python3-pybind11 \
+    python3-flask-script \
+    python3-flask-sijax \
+    python3-html2text \
+    python3-html5lib \
+    python3-intervals \
+    python3-ipy \
+    python3-ipaddress \
+    python3-iso8601 \
+    python3-humanfriendly \
+    python3-lrparsing \
+    python3-itsdangerous \
+    python3-hyperlink \
+    python3-idna-ssl \
+    python3-jdcal \
+    python3-greenstalk \
+    python3-icu \
+    python3-jsonschema \
+    python3-keras-applications \
+    python3-idna \
+    python3-sympy \
+    python3-importlib-metadata \
+    python3-langtable \
+    python3-lockfile \
+    python3-nmap \
+    python3-jdatetime \
+    python3-monotonic \
+    python3-mpmath \
+    python3-jedi \
+    python3-jsonpatch \
+    python3-jsonrpcserver \
+    python3-libconf \
+    python3-netifaces \
+    python3-msm \
+    python3-nocaselist \
+    python3-keras-preprocessing \
+    python3-flask-babel \
+    python3-lorem \
+    python3-javaobj-py3 \
+    python3-passlib \
+    python3-pathlib2 \
+    python3-pexpect \
+    python3-luma-oled \
+    python3-pluggy \
+    python3-lxml \
+    python3-precise-runner \
+    python3-padaos \
+    python3-progress \
+    python3-sqlalchemy \
+    python3-sh \
+    python3-petact \
+    python3-mock \
+    python3-msgpack \
+    python3-pyasn1 \
+    python3-msk \
+    python3-openpyxl \
+    python3-prctl \
+    python3-pyatspi \
+    python3-multidict \
+    python3-netaddr \
+    python3-parse \
+    python3-oauthlib \
+    python3-pyfirmata \
+    python3-pandas \
+    python3-padatious \
+    python3-prompt-toolkit \
+    python3-parse-type \
+    python3-cycler \
+    python3-decorator \
+    python3-django \
+    python3-croniter \
+    python3-flask-user \
+    python3-twitter \
+    python3-evdev \
+    python3-dynamic-dispatch \
+    python3-click-spinner \
+    python3-future \
+    python3-geojson \
+    python3-gunicorn \
+    python3-engineio \
+    python3-gmpy2 \
+    python3-coverage \
+    python3-fastnumbers \
+    python3-fann2 \
+    python3-gnupg \
+    python3-flask-login \
+    python3-pyzmq \
+    python3-cryptography-vectors \
+    python3-flask-uploads \
+    python3-ecdsa \
+    python3-networkx \
+    python3-flask-xstatic \
+    python3-pint \
+    python3-iso3166 \
+    python3-imageio \
+    python3-mccabe \
+    python3-kconfiglib \
+    python3-grpcio-tools \
+    python3-jinja2 \
+    python3-jsmin \
+    python3-greenlet \
+    python3-idna \
+    python3-flask-versioned \
+    python3-httplib2 \
+    python3-ipython-genutils \
+    python3-kiwisolver \
+    python3-lz4 \
+    python3-obd \
+    python3-markdown \
+    python3-m2crypto \
+    python3-paho-mqtt \
+    python3-graphviz \
+    python3-pyaudio \
+    python3-pako \
+    python3-meld3 \
+    python3-parallax \
+    python3-lazy-object-proxy \
+    python3-license-expression \
+    python3-luma-core \
+    python3-natsort \
+    python3-polyline \
+    python3-ordered-set \
+    python3-packaging \
+    python3-parso \
+    python3-pycparser \
+    python3-pycrypto \
+    python3-pydbus \
+    python3-pathtools3 \
+    python3-periphery \
+    python3-pyiface \
+    python3-pyjwt \
+    python3-pykwalify \
+    python3-pylint \
+    python3-pynetlinux \
+    python3-pickleshare \
+    python3-pyopenssl \
+    python3-protobuf \
+    python3-py \
+    python3-pyasn1-modules \
+    python3-pyscaffold \
+    python3-pyserial \
+    python3-pysocks \
+    python3-pytoml \
+    python3-pytest-helpers-namespace \
+    python3-more-itertools \
+    python3-pytest-tempdir \
+    python3-pyflakes \
+    python3-pyrad \
+    python3-pyusb \
+    python3-pyhamcrest \
+    python3-custom-inherit \
+    python3-pymysql \
+    python3-pyperclip \
+    python3-rfc3339-validator \
+    python3-pytz \
+    python3-scrypt \
+    python3-rdflib \
+    python3-sijax \
+    python3-regex \
+    python3-slip-dbus \
+    python3-smbus2 \
+    python3-pytest-metadata \
+    python3-term \
+    python3-pystache \
+    python3-pep8 \
+    python3-pytest-runner \
+    python3-pybluez \
+    python3-rfc3986-validator \
+    python3-pocketsphinx \
+    python3-sdnotify \
+    python3-pycodestyle \
+    python3-pytest \
+    python3-speaklater \
+    python3-wtforms \
+    python3-speedtest-cli \
+    python3-pyudev \
+    python3-sqlparse \
+    python3-pyexpect \
+    python3-pytest-html \
+    python3-uritemplate \
+    python3-cryptography \
+    python3-requests \
+    python3-test-generator \
+    python3-whoosh \
+    python3-xstatic-font-awesome \
+    python3-tqdm \
+    python3-vcversioner \
+    python3-semver \
+    python3-serpent \
+    python3-spidev \
+    python3-sqlsoup \
+    python3-tornado \
+    python3-trafaret \
+    python3-urllib3 \
+    python3-yappi \
+    python3-zipp \
+    python3-texttable \
+    python3-humanize \
+    python3-strict-rfc3339 \
+    python3-supervisor \
+    python3-toml \
+    python3-diskcache \
+    python3-requests-futures \
+    python3-matplotlib \
+    python3-sentry-sdk \
+    python3-xlrd \
+    python3-xstatic \
+    python3-tzlocal \
+    python3-wcwidth \
+    python3-ntplib \
+    python3-u-msgpack-python \
+    python3-python-vlc \
+    python3-xlsxwriter \
+    python3-inflection \
+    python3-tabulate \
+    python3-typing-extensions \
+    python3-pystemd \
+    python3-pid \
+    python3-pkgconfig \
+    python3-pylyrics \
+    python3-pyyaml \
+    python3-raven \
+    python3-stevedore \
+    python3-requests-oauthlib \
+    python3-rfc3987 \
+    python3-psutil \
+    python3-robotframework-seriallibrary \
+    python3-pulsectl \
+    python3-py-ubjson \
+    python3-pyalsaaudio \
+    python3-simpleeval \
+    python3-smbus \
+    python3-pychromecast \
+    python3-pyjks \
+    python3-pymongo \
+    python3-spidev \
+    python3-pynacl \
+    python3-termcolor \
+    python3-pyperf \
+    python3-qrcode \
+    python3-visitor \
+    python3-pyroute2 \
+    python3-webencodings \
+    python3-pyrsistent \
+    python3-werkzeug \
+    python3-pydicti \
+    python3-xmlrunner \
+    python3-smpplib \
+    python3-pymisp \
+    python3-requests-file \
+    python3-requests-toolbelt \
+    python3-ruamel-yaml \
+    python3-setuptools-scm \
+    python3-socketio \
+    python3-soupsieve \
+    python3-textparser \
+    python3-tinyrecord \
+    python3-twine \
+    python3-unidiff \
+    python3-watchdog \
+    python3-webcolors \
+    python3-robotframework \
+    python3-xxhash \
+    python3-yarl \
+    python3-zopeinterface \
+    python3-requests-ftp \
+    python3-scapy \
+    python3-paramiko \
+    python3-twofish \
+    python3-simplejson \
+    python3-snappy \
+    python3-versiontools \
+    python3-flask-wtf \
+    python3-websockets \
+    python3-werkzeug \
+    python3-wrapt \
+    python3-xmltodict \
+    python3-trafaret-config \
+    python3-twisted \
+    python3-txaio \
+    python3-typeguard \
+    python3-pytest-timeout \
+    python3-ujson \
+    python3-waitress \
+    python3-websocket-client \
+    python3-xmodem \
+    python3-djangorestframework \
+    python3-pytest-asyncio \
+    python3-nocasedict \
+    python3-yamlloader \
+    python3-ipython \
+    python3-pycurl \
+    gyp \
+    python3-jsonref \
 &quot;
 
 RDEPENDS_packagegroup-meta-python3-extended = &quot;\
-    python3-pykickstart \
-    python3-meh \
     python3-blivet \
-    python3-pywbem \
-    python3-pyparted \
     ${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;x11&quot;, &quot;python3-blivetgui&quot;, &quot;&quot;, d)} \
+    python3-cson \
+    python3-meh \
+    python3-pyephem \
+    python3-pykickstart \
+    python3-pyparted \
+    python3-pywbem \
+    python3-pywbemtools \
 &quot;
 
 RDEPENDS_packagegroup-meta-python3-connectivity = &quot;\
-    python3-pytun \
+    python3-gsocketpool \
+    python3-h2 \
+    python3-hpack \
+    python3-hyperframe \
     python3-mprpc \
+    python3-priority \
     python3-pyconnman \
-    python3-gsocketpool \
+    python3-pyro4 \
+    python3-thrift \
+    python3-txws \
+    python3-pytun \
+    telepathy-python3 \
 &quot;
 
 RDEPENDS_packagegroup-meta-python3-ptest = &quot;\
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CFA513D4AA48A9213C037F83--
