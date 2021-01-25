Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.4112.1611615240391270519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 14:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YlNyJhgu;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id my11so456065pjb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 14:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vJA75Xg43U6wlM0YnGAHXKVoBWG/9nTq9z9p03a9b1c=;
        b=YlNyJhguNzvM4N4Tuea+upC8MJaccGr8eH/6N2cd3fzkT/j9EIq0jhNFZuhjEJrXIv
         EG6LZsB3hh8ny0thkrhaqQf8w4BfKwiygCXn2AmczhK/UtyhcOjiM7bN2HfLQr/tJKfX
         iSApSszkyr0xLsF0B1CDw15bK3c5dP0Yk9nhmpr205uuUHhOC6Bhc51BDKh23ITZyNCd
         pEUCKueWUeIoUOZxu5Q3hmbNsMTdaj3c/t2HoYQUHXzdtnX76FLVv16gwwHiJrvwuSYr
         8Yo7kfTaOpFqkuS33NZawDoicKN/44FTvxQlWEv0b3/ICJRinzTHtR2rfltjDCC9j4qs
         9fsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vJA75Xg43U6wlM0YnGAHXKVoBWG/9nTq9z9p03a9b1c=;
        b=YRZAfQ0c/2NytlU2/0UK5x0yuODYUdwn5YQrbDOHMQPXdIg4GiiV+ceXgwlP5//A10
         talB6YYD92ht3F7bVMH8kFtD5cMHWUGi9xDkYa2q3cJYAanALsOsRxYQn6VtANAO9ROT
         lD/ucr3OdB8nPcEVgWO0eJ1JHDbpOhGsEfZi5TGr/ai9VaJ7FEXJCHhHNWF7DKCUwUcc
         8whPL6SIhjPGlbIyUYXedEqER2TEiP+Ty3s1IPGW0m2DrW6RWA97kjUXlGomBMVnMXEO
         uWZDgXAHFlDFoCX/K/jujbBcNFr+w1O4Ep9UWCopLFxCF1zpHECdzFreyoWoFk1zKNEa
         6tGg==
X-Gm-Message-State: AOAM530HeuohyIcN8Zht8LyQYYkp+TYLvnD7DYKfBuyLBDIixZw3FPL1
	WWhsX8ZjlCTHvKQa6fjkKBc=
X-Google-Smtp-Source: ABdhPJwd/h5v2yKi/7bf0MgvOBkjMCXVaPcEvm57+4wypHXei/OcDXnn1OhaCSWOWLdD3tRVpaPu4A==
X-Received: by 2002:a17:902:7c04:b029:dc:99f2:eea4 with SMTP id x4-20020a1709027c04b02900dc99f2eea4mr2674500pll.43.1611615239647;
        Mon, 25 Jan 2021 14:53:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b0f2:af7b:8412:cef7? ([2601:646:9200:a0f0:b0f2:af7b:8412:cef7])
        by smtp.gmail.com with ESMTPSA id g22sm13752021pfu.200.2021.01.25.14.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 14:53:59 -0800 (PST)
Subject: Re: [meta-python][PATCH 1/2] packagegroup-meta-python: sort package names, add notes
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: ticotimo@gmail.com
References: <20210125142500.936815-1-trevor.gamblin@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8c282148-4e1b-89cc-9001-7868196d8bb9@gmail.com>
Date: Mon, 25 Jan 2021 14:53:57 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125142500.936815-1-trevor.gamblin@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

have you taken care of the patch that Andreas sent earlier ?

On 1/25/21 6:24 AM, Trevor Gamblin wrote:
> The packagegroup-meta-python file's package lists were unsorted, so
> they were reorded to make it easier to manually inspect. Additionally,
> the packagegroup-meta-python3-extended and -connectivity packagegroups
> did not appear to have any use except to be added to the main group,
> so they were removed and their recipe lists combined into the main
> packagegroup-meta-python3. Finally, a note about enabling Fortran
> support in the compiler was added to the file, since python3-cvxopt
> relies on it in order to build.
> 
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb | 624 +++++++++---------
>   1 file changed, 308 insertions(+), 316 deletions(-)
> 
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 5f81fd35b..bbc9a80b3 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -7,442 +7,434 @@ PACKAGES = ' \
>       packagegroup-meta-python3 \
>   '
>   
> +# Note that python3-cvxopt requires Fortran support. To enable this,
> +# add the following to your local.conf:
> +# FORTRAN_forcevariable = ",fortran"
>   RDEPENDS_packagegroup-meta-python3 = "\
> -    packagegroup-meta-python3-extended \
> -    packagegroup-meta-python3-connectivity \
> -"
> -
> -RDEPENDS_packagegroup-meta-python3 = "\
> +    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
> +    gyp \
>       pamela \
>       pyrtm \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-systemd", "", d)} \
> -    python3-bcrypt \
> -    python3-flask-mail \
> -    python3-editor \
> -    python3-flask-pymongo \
> -    python3-cffi \
> -    python3-pillow \
> -    python3-markupsafe \
> -    python3-flask-nav \
> -    python3-asciitree \
> -    python3-flask-sqlalchemy \
> -    python3-gevent \
> +    python3-absl \
>       python3-aenum \
> -    python3-gast \
> -    python3-blinker \
> -    python3-prettytable \
> -    python3-cmd2 \
>       python3-aiofiles \
> -    python3-anyjson \
> -    python3-isodate \
> -    python3-incremental \
> -    python3-aiohttp-jinja2 \
>       python3-aiohttp \
> +    python3-aiohttp-jinja2 \
>       python3-alembic \
>       python3-ansi2html \
>       python3-ansicolors \
> -    python3-argcomplete \
> -    python3-argexec \
> +    python3-anyjson \
>       python3-appdirs \
>       python3-apply-defaults \
> +    python3-argcomplete \
> +    python3-argexec \
>       python3-argh \
> -    python3-ply \
> -    python3-astroid \
> -    python3-ndg-httpsclient \
>       python3-arpeggio \
> -    python3-astor \
> -    python3-pika \
> +    python3-asciitree \
>       python3-asn1crypto \
> +    python3-astor \
> +    python3-astroid \
>       python3-async-timeout \
> -    python3-absl \
>       python3-attr \
> -    python3-flask \
>       python3-autobahn \
> -    python3-babel \
> -    python3-pretend \
>       python3-automat \
> -    python3-ptyprocess \
>       python3-aws-iot-device-sdk-python \
> -    python3-bandit \
> +    python3-babel \
>       python3-backcall \
>       python3-backports-functools-lru-cache \
> +    python3-bandit \
> +    python3-bcrypt \
>       python3-beautifulsoup4 \
> -    python3-betamax \
>       python3-behave \
> -    python3-jsonpointer \
> +    python3-betamax \
>       python3-bitarray \
>       python3-bitstring \
>       python3-bitstruct \
> -    python3-cachecontrol \
> +    python3-blinker \
> +    python3-blivet \
>       python3-booleanpy \
> +    python3-cachecontrol \
>       python3-cachetools \
>       python3-can \
>       python3-cantools \
>       python3-cassandra-driver \
>       python3-cbor2 \
> -    python3-chardet \
> +    python3-cerberus \
>       python3-certifi \
> -    python3-isort \
> -    python3-colorama \
> +    python3-cffi \
> +    python3-chardet \
>       python3-cheetah \
>       python3-click \
> -    python3-huey \
> +    python3-click-repl \
> +    python3-click-spinner \
> +    python3-cmd2 \
> +    python3-colorama \
>       python3-coloredlogs \
>       python3-colorlog \
> -    python3-wheel \
> -    python3-configshell-fb \
> -    python3-constantly \
> -    python3-contextlib2 \
>       python3-configargparse \
> -    python3-crcmod \
>       python3-configobj \
>       python3-configparser \
> +    python3-configshell-fb \
> +    python3-constantly \
> +    python3-contextlib2 \
> +    python3-coverage \
>       python3-cppy \
> -    python3-dbussy \
> +    python3-crcmod \
> +    python3-croniter \
> +    python3-cryptography \
> +    python3-cryptography-vectors \
> +    python3-cson \
> +    python3-custom-inherit \
> +    python3-cvxopt \
> +    python3-cycler \
> +    python3-dateparser \
>       python3-dateutil \
> +    python3-dbus-next \
> +    python3-dbussy \
> +    python3-decorator \
> +    python3-defusedxml \
> +    python3-dill \
> +    python3-diskcache \
>       python3-distro \
> -    python3-click-repl \
> -    python3-redis \
> +    python3-django \
> +    python3-django-south \
> +    python3-djangorestframework \
> +    python3-dnspython \
> +    python3-docopt \
>       python3-dominate \
> +    python3-dt-schema \
> +    python3-dynamic-dispatch \
> +    python3-ecdsa \
> +    python3-editor \
> +    python3-engineio \
>       python3-et-xmlfile \
> +    python3-evdev \
> +    python3-fann2 \
> +    python3-fasteners \
> +    python3-fastnumbers \
>       python3-feedformatter \
> +    python3-flask \
> +    python3-flask-babel \
> +    python3-flask-bootstrap \
>       python3-flask-jsonpify \
>       python3-flask-jwt \
> +    python3-flask-login \
> +    python3-flask-mail \
>       python3-flask-migrate \
> -    python3-pyinotify \
> +    python3-flask-nav \
> +    python3-flask-pymongo \
>       python3-flask-restful \
> +    python3-flask-script \
> +    python3-flask-sijax \
>       python3-flask-socketio \
> +    python3-flask-sqlalchemy \
> +    python3-flask-uploads \
> +    python3-flask-user \
> +    python3-flask-versioned \
> +    python3-flask-wtf \
> +    python3-flask-xstatic \
> +    python3-future \
> +    python3-gast \
> +    python3-geojson \
> +    python3-gevent \
> +    python3-gmpy2 \
>       python3-gmqtt \
> -    python3-dateparser \
> -    python3-defusedxml \
> -    python3-rsa \
> -    python3-django-south \
> -    python3-grpcio \
> -    python3-pybind11-json \
> +    python3-gnupg \
>       python3-google-api-python-client \
> +    python3-graphviz \
> +    python3-greenlet \
> +    python3-greenstalk \
> +    python3-grpcio \
> +    python3-grpcio-tools \
> +    python3-gsocketpool \
> +    python3-gunicorn \
> +    python3-h2 \
>       python3-h5py \
> -    python3-dt-schema \
>       python3-haversine \
> -    python3-fasteners \
> -    python3-flask-bootstrap \
> -    python3-dbus-next \
> -    python3-dnspython \
> -    python3-traitlets \
> -    python3-pybind11 \
> -    python3-flask-script \
> -    python3-flask-sijax \
> +    python3-hexdump \
> +    python3-hpack \
>       python3-html2text \
>       python3-html5lib \
> -    python3-intervals \
> -    python3-ipy \
> -    python3-ipaddress \
> -    python3-iso8601 \
> +    python3-httplib2 \
> +    python3-huey \
>       python3-humanfriendly \
> -    python3-lrparsing \
> -    python3-itsdangerous \
> +    python3-humanize \
> +    python3-hyperframe \
>       python3-hyperlink \
> -    python3-idna-ssl \
> -    python3-jdcal \
> -    python3-greenstalk \
>       python3-icu \
> -    python3-jsonschema \
> -    python3-keras-applications \
>       python3-idna \
> -    python3-sympy \
> -    python3-langtable \
> -    python3-lockfile \
> -    python3-nmap \
> +    python3-idna \
> +    python3-idna-ssl \
> +    python3-imageio \
> +    python3-incremental \
> +    python3-inflection \
> +    python3-intervals \
> +    python3-ipaddress \
> +    python3-ipy \
> +    python3-ipython \
> +    python3-ipython-genutils \
> +    python3-iso3166 \
> +    python3-iso8601 \
> +    python3-isodate \
> +    python3-isort \
> +    python3-itsdangerous \
> +    python3-javaobj-py3 \
>       python3-jdatetime \
> -    python3-monotonic \
> -    python3-mpmath \
> +    python3-jdcal \
>       python3-jedi \
> +    python3-jsmin \
>       python3-jsonpatch \
> +    python3-jsonpath-rw \
> +    python3-jsonpointer \
> +    python3-jsonref \
>       python3-jsonrpcserver \
> -    python3-libconf \
> -    python3-netifaces \
> -    python3-msm \
> -    python3-nocaselist \
> +    python3-jsonschema \
> +    python3-jstyleson \
> +    python3-kconfiglib \
> +    python3-keras-applications \
>       python3-keras-preprocessing \
> -    python3-flask-babel \
> +    python3-kiwisolver \
> +    python3-langtable \
> +    python3-lazy-object-proxy \
> +    python3-libconf \
> +    python3-license-expression \
> +    python3-lockfile \
>       python3-lorem \
> -    python3-javaobj-py3 \
> -    python3-passlib \
> -    python3-pexpect \
> +    python3-lrparsing \
> +    python3-luma-core \
>       python3-luma-oled \
>       python3-lxml \
> -    python3-precise-runner \
> -    python3-padaos \
> -    python3-progress \
> -    python3-sqlalchemy \
> -    python3-sh \
> -    python3-petact \
> +    python3-lz4 \
> +    python3-m2crypto \
> +    python3-markdown \
> +    python3-markupsafe \
> +    python3-matplotlib \
> +    python3-mccabe \
> +    python3-meh \
> +    python3-meld3 \
>       python3-mock \
> +    python3-monotonic \
> +    python3-mpmath \
>       python3-msgpack \
> -    python3-pyasn1 \
>       python3-msk \
> -    python3-openpyxl \
> -    python3-prctl \
> -    python3-pyatspi \
> +    python3-msm \
>       python3-multidict \
> +    python3-natsort \
> +    python3-ndg-httpsclient \
>       python3-netaddr \
> -    python3-parse \
> +    python3-netifaces \
> +    python3-networkx \
> +    python3-nmap \
> +    python3-nocasedict \
> +    python3-nocaselist \
> +    python3-ntplib \
>       python3-oauthlib \
> -    python3-pyfirmata \
> -    python3-pandas \
> +    python3-obd \
> +    python3-openpyxl \
> +    python3-ordered-set \
> +    python3-padaos \
>       python3-padatious \
> -    python3-prompt-toolkit \
> -    python3-parse-type \
> -    python3-cycler \
> -    python3-decorator \
> -    python3-django \
> -    python3-croniter \
> -    python3-flask-user \
> -    python3-twitter \
> -    python3-evdev \
> -    python3-dynamic-dispatch \
> -    python3-click-spinner \
> -    python3-future \
> -    python3-geojson \
> -    python3-gunicorn \
> -    python3-engineio \
> -    python3-gmpy2 \
> -    python3-coverage \
> -    python3-fastnumbers \
> -    python3-fann2 \
> -    python3-gnupg \
> -    python3-flask-login \
> -    python3-pyzmq \
> -    python3-cryptography-vectors \
> -    python3-flask-uploads \
> -    python3-ecdsa \
> -    python3-networkx \
> -    python3-flask-xstatic \
> -    python3-pint \
> -    python3-iso3166 \
> -    python3-imageio \
> -    python3-mccabe \
> -    python3-kconfiglib \
> -    python3-grpcio-tools \
> -    python3-jsmin \
> -    python3-greenlet \
> -    python3-idna \
> -    python3-flask-versioned \
> -    python3-httplib2 \
> -    python3-ipython-genutils \
> -    python3-kiwisolver \
> -    python3-lz4 \
> -    python3-obd \
> -    python3-markdown \
> -    python3-m2crypto \
>       python3-paho-mqtt \
> -    python3-graphviz \
> -    python3-pyaudio \
>       python3-pako \
> -    python3-meld3 \
> +    python3-pandas \
>       python3-parallax \
> -    python3-lazy-object-proxy \
> -    python3-license-expression \
> -    python3-luma-core \
> -    python3-natsort \
> -    python3-polyline \
> -    python3-ordered-set \
> +    python3-paramiko \
> +    python3-parse \
> +    python3-parse-type \
>       python3-parso \
> +    python3-passlib \
> +    python3-pathtools3 \
> +    python3-pep8 \
> +    python3-periphery \
> +    python3-petact \
> +    python3-pexpect \
> +    python3-pickleshare \
> +    python3-pid \
> +    python3-pika \
> +    python3-pillow \
> +    python3-pint \
> +    python3-pkgconfig \
> +    python3-ply \
> +    python3-pocketsphinx \
> +    python3-polyline \
> +    python3-prctl \
> +    python3-precise-runner \
> +    python3-pretend \
> +    python3-prettytable \
> +    python3-priority \
> +    python3-progress \
> +    python3-prompt-toolkit \
> +    python3-protobuf \
> +    python3-psutil \
> +    python3-ptyprocess \
> +    python3-pulsectl \
> +    python3-py-ubjson \
> +    python3-pyalsaaudio \
> +    python3-pyasn1 \
> +    python3-pyasn1-modules \
> +    python3-pyatspi \
> +    python3-pyaudio \
> +    python3-pybind11 \
> +    python3-pybind11-json \
> +    python3-pybluez \
> +    python3-pychromecast \
> +    python3-pycodestyle \
> +    python3-pyconnman \
>       python3-pycparser \
>       python3-pycrypto \
> +    python3-pycurl \
>       python3-pydbus \
> -    python3-pathtools3 \
> -    python3-periphery \
> +    python3-pydicti \
> +    python3-pyephem \
> +    python3-pyexpect \
> +    python3-pyfirmata \
> +    python3-pyflakes \
> +    python3-pyhamcrest \
>       python3-pyiface \
> +    python3-pyinotify \
> +    python3-pyjks \
>       python3-pyjwt \
> +    python3-pykickstart \
>       python3-pykwalify \
> -    python3-docopt \
>       python3-pylint \
> +    python3-pylyrics \
> +    python3-pymisp \
> +    python3-pymongo \
> +    python3-pymysql \
> +    python3-pynacl \
>       python3-pynetlinux \
> -    python3-pickleshare \
>       python3-pyopenssl \
> -    python3-protobuf \
> -    python3-pyasn1-modules \
> +    python3-pyparted \
> +    python3-pyperclip \
> +    python3-pyperf \
> +    python3-pyrad \
> +    python3-pyro4 \
> +    python3-pyroute2 \
> +    python3-pyrsistent \
>       python3-pyscaffold \
>       python3-pyserial \
>       python3-pysocks \
> -    python3-pytoml \
> +    python3-pystache \
> +    python3-pystemd \
> +    python3-pytest-asyncio \
>       python3-pytest-helpers-namespace \
> +    python3-pytest-html \
> +    python3-pytest-metadata \
> +    python3-pytest-runner \
>       python3-pytest-tempdir \
> -    python3-pyflakes \
> -    python3-pyrad \
> +    python3-pytest-timeout \
> +    python3-python-vlc \
> +    python3-pytoml \
> +    python3-pytun \
> +    python3-pytz \
> +    python3-pyudev \
>       python3-pyusb \
> -    python3-pyhamcrest \
> -    python3-custom-inherit \
> -    python3-pymysql \
> -    python3-pyperclip \
> +    python3-pywbem \
> +    python3-pywbemtools \
> +    python3-pyyaml \
> +    python3-pyzmq \
> +    python3-qrcode \
> +    python3-raven \
> +    python3-rdflib \
> +    python3-redis \
> +    python3-regex \
> +    python3-requests \
> +    python3-requests-file \
> +    python3-requests-ftp \
> +    python3-requests-futures \
> +    python3-requests-oauthlib \
> +    python3-requests-toolbelt \
>       python3-rfc3339-validator \
> -    python3-pytz \
> +    python3-rfc3986-validator \
> +    python3-rfc3987 \
> +    python3-robotframework \
> +    python3-robotframework-seriallibrary \
> +    python3-rsa \
> +    python3-ruamel-yaml \
> +    python3-scapy \
>       python3-scrypt \
> -    python3-rdflib \
> +    python3-sdnotify \
> +    python3-semver \
> +    python3-sentry-sdk \
> +    python3-serpent \
> +    python3-sh \
>       python3-sijax \
> -    python3-regex \
> +    python3-simpleeval \
> +    python3-simplejson \
>       python3-slip-dbus \
> +    python3-smbus \
>       python3-smbus2 \
> -    python3-pytest-metadata \
> -    python3-term \
> -    python3-pystache \
> -    python3-pep8 \
> -    python3-pytest-runner \
> -    python3-pybluez \
> -    python3-rfc3986-validator \
> -    python3-pocketsphinx \
> -    python3-sdnotify \
> -    python3-pycodestyle \
> +    python3-smpplib \
> +    python3-snappy \
> +    python3-socketio \
> +    python3-soupsieve \
>       python3-speaklater \
> -    python3-wtforms \
>       python3-speedtest-cli \
> -    python3-pyudev \
> -    python3-sqlparse \
> -    python3-pyexpect \
> -    python3-pytest-html \
> -    python3-uritemplate \
> -    python3-cryptography \
> -    python3-requests \
> -    python3-test-generator \
> -    python3-whoosh \
> -    python3-xstatic-font-awesome \
> -    python3-tqdm \
> -    python3-vcversioner \
> -    python3-semver \
> -    python3-serpent \
>       python3-spidev \
> +    python3-spidev \
> +    python3-sqlalchemy \
> +    python3-sqlparse \
>       python3-sqlsoup \
> -    python3-tornado \
> -    python3-trafaret \
> -    python3-urllib3 \
> -    python3-yappi \
> -    python3-texttable \
> -    python3-humanize \
> +    python3-stevedore \
>       python3-strict-rfc3339 \
>       python3-supervisor \
> -    python3-diskcache \
> -    python3-requests-futures \
> -    python3-matplotlib \
> -    python3-sentry-sdk \
> -    python3-xlrd \
> -    python3-xstatic \
> -    python3-tzlocal \
> -    python3-ntplib \
> -    python3-u-msgpack-python \
> -    python3-python-vlc \
> -    python3-xlsxwriter \
> -    python3-inflection \
> +    python3-sympy \
>       python3-tabulate \
> -    python3-typing-extensions \
> -    python3-pystemd \
> -    python3-pid \
> -    python3-pkgconfig \
> -    python3-pylyrics \
> -    python3-pyyaml \
> -    python3-raven \
> -    python3-stevedore \
> -    python3-requests-oauthlib \
> -    python3-rfc3987 \
> -    python3-psutil \
> -    python3-robotframework-seriallibrary \
> -    python3-pulsectl \
> -    python3-py-ubjson \
> -    python3-pyalsaaudio \
> -    python3-simpleeval \
> -    python3-smbus \
> -    python3-pychromecast \
> -    python3-pyjks \
> -    python3-pymongo \
> -    python3-spidev \
> -    python3-pynacl \
> +    python3-term \
>       python3-termcolor \
> -    python3-pyperf \
> -    python3-qrcode \
> -    python3-visitor \
> -    python3-pyroute2 \
> -    python3-webencodings \
> -    python3-pyrsistent \
> -    python3-werkzeug \
> -    python3-pydicti \
> -    python3-xmlrunner \
> -    python3-smpplib \
> -    python3-pymisp \
> -    python3-requests-file \
> -    python3-requests-toolbelt \
> -    python3-ruamel-yaml \
> -    python3-socketio \
> -    python3-soupsieve \
> +    python3-test-generator \
>       python3-textparser \
> +    python3-texttable \
> +    python3-thrift \
>       python3-tinyrecord \
> +    python3-tornado \
> +    python3-tqdm \
> +    python3-trafaret \
> +    python3-trafaret-config \
> +    python3-traitlets \
> +    python3-transitions \
>       python3-twine \
> +    python3-twisted \
> +    python3-twitter \
> +    python3-twofish \
> +    python3-txaio \
> +    python3-txws \
> +    python3-typeguard \
> +    python3-typing-extensions \
> +    python3-tzlocal \
> +    python3-u-msgpack-python \
> +    python3-ujson \
>       python3-unidiff \
> +    python3-uritemplate \
> +    python3-urllib3 \
> +    python3-vcversioner \
> +    python3-versiontools \
> +    python3-visitor \
> +    python3-waitress \
>       python3-watchdog \
>       python3-webcolors \
> -    python3-robotframework \
> -    python3-xxhash \
> -    python3-yarl \
> -    python3-zopeinterface \
> -    python3-requests-ftp \
> -    python3-scapy \
> -    python3-paramiko \
> -    python3-twofish \
> -    python3-simplejson \
> -    python3-snappy \
> -    python3-versiontools \
> -    python3-flask-wtf \
> +    python3-webencodings \
> +    python3-websocket-client \
>       python3-websockets \
>       python3-werkzeug \
> +    python3-werkzeug \
> +    python3-wheel \
> +    python3-whoosh \
>       python3-wrapt \
> +    python3-wtforms \
> +    python3-xlrd \
> +    python3-xlsxwriter \
> +    python3-xmlrunner \
>       python3-xmltodict \
> -    python3-trafaret-config \
> -    python3-twisted \
> -    python3-txaio \
> -    python3-typeguard \
> -    python3-pytest-timeout \
> -    python3-ujson \
> -    python3-waitress \
> -    python3-websocket-client \
>       python3-xmodem \
> -    python3-djangorestframework \
> -    python3-pytest-asyncio \
> -    python3-nocasedict \
> +    python3-xstatic \
> +    python3-xstatic-font-awesome \
> +    python3-xxhash \
>       python3-yamlloader \
> -    python3-ipython \
> -    python3-pycurl \
> -    gyp \
> -    python3-jsonref \
> -    python3-transitions \
> -    python3-dill \
> -    python3-cerberus \
> -    python3-cvxopt \
> -    python3-jsonpath-rw \
> -    python3-hexdump \
> -    python3-jstyleson \
> -"
> -
> -RDEPENDS_packagegroup-meta-python3-extended = "\
> -    python3-blivet \
> -    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "python3-blivetgui", "", d)} \
> -    python3-cson \
> -    python3-meh \
> -    python3-pyephem \
> -    python3-pykickstart \
> -    python3-pyparted \
> -    python3-pywbem \
> -    python3-pywbemtools \
> -"
> -
> -RDEPENDS_packagegroup-meta-python3-connectivity = "\
> -    python3-gsocketpool \
> -    python3-h2 \
> -    python3-hpack \
> -    python3-hyperframe \
> -    python3-priority \
> -    python3-pyconnman \
> -    python3-pyro4 \
> -    python3-thrift \
> -    python3-txws \
> -    python3-pytun \
> +    python3-yappi \
> +    python3-yarl \
> +    python3-zopeinterface \
>       telepathy-python3 \
>   "
>   
> 
