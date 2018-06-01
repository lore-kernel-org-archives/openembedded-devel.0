Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 40FA471AB3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jun 2018 16:38:25 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id a14-v6so12768757pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jun 2018 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=kfk8LbzuGk2GKndiMHcgFXd6f61rI/NBXn0qHb5Cgn0=;
	b=ZwVy4nzrYtqxYofmJkkmf3+V2MIyorhKKHI4D532xPdP21N/bF+hK2cINunFyUBJ2e
	X7w7L5TjhWZ3Fs/bOCIakmmMoGUQsV41nOXcrXNg5NLWMQzrf6QE5QU8mO0p0ic0ejdE
	Xk8iTFdYkD9v8p+QwnIBxxjzTwnNrSEMeu3gk+ZZej0rdjoJEn5zrQxl03MkCt++txOV
	fLA19yoUws0XmtLJ1wFAtq8YjKvRnHYTGg2uJUgyXOrqWDILFo12MNpX5zRmfAhJb2AN
	F1QupfoGN9/dnEUs3TtoBIomVWZCoHZ7TZFiMmo1sAvx+m33LXMzzHwNLKTkuu5RQjeM
	V+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=kfk8LbzuGk2GKndiMHcgFXd6f61rI/NBXn0qHb5Cgn0=;
	b=gw3JHzMSha6TSA8tvlSuOVw0cgKv1rZ/jhOBdnMCL4LimFju2qjXt8IE7DUMUEh8nQ
	4rrMgH1cGq8PCKq9uXg5WO6Lfyex4bwiBfARnp7KN61fAGxj03wgr87knH/Evhn99Pg4
	JZlsORtY+Ws9qyhR799puufoDqsWdJXq/cqbCeZqX0Stow0cN1y3cHRYC4ziA+MN8UFn
	Wxw2b20EMn6XFaf9ltnXxAecgJsSPjulopy4CMMY0tZ8/8DB3hPDXaSECztj5NQTJIWf
	fa7eT1erNd3Nygz+L2QRko4ZwVa6efJIiDqgP+vXHyqjbbgppgzHo6pXNvSmA/B2lmtP
	TjwA==
X-Gm-Message-State: ALKqPwdzUYCrbyLyfo71NH56K3vdfeuKC1XJbL7TAMMBylL3wzahLPsz
	LZw0Oc0nRItKHqStjo++2tY=
X-Google-Smtp-Source: ADUXVKLB4r4p3cb3W9jvjhkhro/sTR0SkAbcA/EugeRlsrLcXza2HIKQTUAan3zUg/qCXP1zfed4jg==
X-Received: by 2002:a62:4c04:: with SMTP id
	z4-v6mr11420576pfa.205.1527871106850; 
	Fri, 01 Jun 2018 09:38:26 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:2ca8:85c9:c335:d6ec?
	([2601:646:877f:9499:2ca8:85c9:c335:d6ec])
	by smtp.gmail.com with ESMTPSA id
	j5-v6sm103854813pfe.119.2018.06.01.09.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 09:38:26 -0700 (PDT)
To: Nicola Lunghi <nick83ola@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180601103540.13159-1-nick83ola@gmail.com>
	<20180601103540.13159-2-nick83ola@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
	Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
	miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
	/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
	4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
	ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
	jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
	6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
	PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQIIAwQWAgMB
	Ah4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0gAJ9wRt36PqfjNe90
	4evWolFf5cMmp87DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
	DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
	2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
	I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
	RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
	6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
	584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
	HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
	KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
	seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
	3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
	9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
	EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
	X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
	3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
	jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
	UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
	mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
	suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
	XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
	VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
Message-ID: <85353b0a-1595-b1f3-937e-9c5d336780f7@gmail.com>
Date: Fri, 1 Jun 2018 09:38:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180601103540.13159-2-nick83ola@gmail.com>
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: Re: [PATCH 2/2] mosquitto: add default configuration file
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
X-List-Received-Date: Fri, 01 Jun 2018 16:38:26 -0000
X-Groupsio-MsgNum: 72564
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="fkG1KPbbbWLHeNb9H4VZRHwDLYqwKfpwS"

--fkG1KPbbbWLHeNb9H4VZRHwDLYqwKfpwS
Content-Type: multipart/mixed; boundary="ghz2rsIUiS3sGHAPdLvmteIEML6YmHOIj";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Nicola Lunghi <nick83ola@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Message-ID: <85353b0a-1595-b1f3-937e-9c5d336780f7@gmail.com>
Subject: Re: [oe] [PATCH 2/2] mosquitto: add default configuration file
References: <20180601103540.13159-1-nick83ola@gmail.com>
 <20180601103540.13159-2-nick83ola@gmail.com>
In-Reply-To: <20180601103540.13159-2-nick83ola@gmail.com>

--ghz2rsIUiS3sGHAPdLvmteIEML6YmHOIj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/1/18 3:35 AM, Nicola Lunghi wrote:
> From: Nicola Lunghi <nicola.lunghi@jci.com>
>=20
> Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
> ---
>  .../mosquitto/files/mosquitto.conf            | 837 ++++++++++++++++++=

>  .../mosquitto/mosquitto_1.4.14.bb             |   4 +
>  2 files changed, 841 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/mosquitto/file=
s/mosquitto.conf

whats the source of this conf file ? if its adapted from some sample
file, may be we can just use some sed/awk operations in do_install
instead of adding this file explicitly.

>=20
> diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosqu=
itto.conf b/meta-networking/recipes-connectivity/mosquitto/files/mosquitt=
o.conf
> new file mode 100644
> index 0000000000..e4223c75d6
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.co=
nf
> @@ -0,0 +1,837 @@
> +# Config file for mosquitto
> +#
> +# See mosquitto.conf(5) for more information.
> +#
> +# Default values are shown, uncomment to change.
> +#
> +# Use the # character to indicate a comment, but only if it is the
> +# very first character on the line.
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# General configuration
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +# Time in seconds to wait before resending an outgoing QoS=3D1 or
> +# QoS=3D2 message.
> +#retry_interval 20
> +
> +# Time in seconds between updates of the $SYS tree.
> +# Set to 0 to disable the publishing of the $SYS tree.
> +#sys_interval 10
> +
> +# Time in seconds between cleaning the internal message store of
> +# unreferenced messages. Lower values will result in lower memory
> +# usage but more processor time, higher values will have the
> +# opposite effect.
> +# Setting a value of 0 means the unreferenced messages will be
> +# disposed of as quickly as possible.
> +#store_clean_interval 10
> +
> +# Write process id to a file. Default is a blank string which means
> +# a pid file shouldn't be written.
> +# This should be set to /var/run/mosquitto.pid if mosquitto is
> +# being run automatically on boot with an init script and
> +# start-stop-daemon or similar.
> +#pid_file
> +
> +# When run as root, drop privileges to this user and its primary
> +# group.
> +# Leave blank to stay as root, but this is not recommended.
> +# If run as a non-root user, this setting has no effect.
> +# Note that on Windows this has no effect and so mosquitto should
> +# be started by the user you wish it to run as.
> +#user mosquitto
> +
> +# The maximum number of QoS 1 and 2 messages currently inflight per
> +# client.
> +# This includes messages that are partway through handshakes and
> +# those that are being retried. Defaults to 20. Set to 0 for no
> +# maximum. Setting to 1 will guarantee in-order delivery of QoS 1
> +# and 2 messages.
> +#max_inflight_messages 20
> +
> +# The maximum number of QoS 1 and 2 messages to hold in a queue
> +# above those that are currently in-flight.  Defaults to 100. Set
> +# to 0 for no maximum (not recommended).
> +# See also queue_qos0_messages.
> +#max_queued_messages 100
> +
> +# Set to true to queue messages with QoS 0 when a persistent client is=

> +# disconnected. These messages are included in the limit imposed by
> +# max_queued_messages.
> +# Defaults to false.
> +# This is a non-standard option for the MQTT v3.1 spec but is allowed =
in
> +# v3.1.1.
> +#queue_qos0_messages false
> +
> +# This option sets the maximum publish payload size that the broker wi=
ll allow.
> +# Received messages that exceed this size will not be accepted by the =
broker.
> +# The default value is 0, which means that all valid MQTT messages are=

> +# accepted. MQTT imposes a maximum payload size of 268435455 bytes.
> +#message_size_limit 0
> +
> +# This option controls whether a client is allowed to connect with a z=
ero
> +# length client id or not. This option only affects clients using MQTT=
 v3.1.1
> +# and later. If set to false, clients connecting with a zero length cl=
ient id
> +# are disconnected. If set to true, clients will be allocated a client=
 id by
> +# the broker. This means it is only useful for clients with clean sess=
ion set
> +# to true.
> +#allow_zero_length_clientid true
> +
> +# If allow_zero_length_clientid is true, this option allows you to set=
 a prefix
> +# to automatically generated client ids to aid visibility in logs.
> +#auto_id_prefix
> +
> +# This option allows persistent clients (those with clean session set =
to false)
> +# to be removed if they do not reconnect within a certain time frame.
> +#
> +# This is a non-standard option in MQTT V3.1 but allowed in MQTT v3.1.=
1.
> +#
> +# Badly designed clients may set clean session to false whilst using a=
 randomly
> +# generated client id. This leads to persistent clients that will neve=
r
> +# reconnect. This option allows these clients to be removed.
> +#
> +# The expiration period should be an integer followed by one of h d w =
m y for
> +# hour, day, week, month and year respectively. For example
> +#
> +# persistent_client_expiration 2m
> +# persistent_client_expiration 14d
> +# persistent_client_expiration 1y
> +#
> +# The default if not set is to never expire persistent clients.
> +#persistent_client_expiration
> +
> +# If a client is subscribed to multiple subscriptions that overlap, e.=
g. foo/#
> +# and foo/+/baz , then MQTT expects that when the broker receives a me=
ssage on
> +# a topic that matches both subscriptions, such as foo/bar/baz, then t=
he client
> +# should only receive the message once.
> +# Mosquitto keeps track of which clients a message has been sent to in=
 order to
> +# meet this requirement. The allow_duplicate_messages option allows th=
is
> +# behaviour to be disabled, which may be useful if you have a large nu=
mber of
> +# clients subscribed to the same set of topics and are very concerned =
about
> +# minimising memory usage.
> +# It can be safely set to true if you know in advance that your client=
s will
> +# never have overlapping subscriptions, otherwise your clients must be=
 able to
> +# correctly deal with duplicate messages even when then have QoS=3D2.
> +#allow_duplicate_messages false
> +
> +# The MQTT specification requires that the QoS of a message delivered =
to a
> +# subscriber is never upgraded to match the QoS of the subscription. E=
nabling
> +# this option changes this behaviour. If upgrade_outgoing_qos is set t=
rue,
> +# messages sent to a subscriber will always match the QoS of its subsc=
ription.
> +# This is a non-standard option explicitly disallowed by the spec.
> +#upgrade_outgoing_qos false
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# Default listener
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +# IP address/hostname to bind the default listener to. If not
> +# given, the default listener will not be bound to a specific
> +# address and so will be accessible to all network interfaces.
> +# bind_address ip-address/host name
> +#bind_address
> +
> +# Port to use for the default listener.
> +#port 1883
> +
> +# The maximum number of client connections to allow. This is
> +# a per listener setting.
> +# Default is -1, which means unlimited connections.
> +# Note that other process limits mean that unlimited connections
> +# are not really possible. Typically the default maximum number of
> +# connections possible is around 1024.
> +#max_connections -1
> +
> +# Choose the protocol to use when listening.
> +# This can be either mqtt or websockets.
> +# Websockets support is currently disabled by default at compile time.=

> +# Certificate based TLS may be used with websockets, except that
> +# only the cafile, certfile, keyfile and ciphers options are supported=
=2E
> +#protocol mqtt
> +
> +# When a listener is using the websockets protocol, it is possible to =
serve
> +# http data as well. Set http_dir to a directory which contains the fi=
les you
> +# wish to serve. If this option is not specified, then no normal http
> +# connections will be possible.
> +#http_dir
> +
> +# Set use_username_as_clientid to true to replace the clientid that a =
client
> +# connected with with its username. This allows authentication to be t=
ied to
> +# the clientid, which means that it is possible to prevent one client
> +# disconnecting another by using the same clientid.
> +# If a client connects with no username it will be disconnected as not=

> +# authorised when this option is set to true.
> +# Do not use in conjunction with clientid_prefixes.
> +# See also use_identity_as_username.
> +#use_username_as_clientid
> +
> +# -----------------------------------------------------------------
> +# Certificate based SSL/TLS support
> +# -----------------------------------------------------------------
> +# The following options can be used to enable SSL/TLS support for
> +# this listener. Note that the recommended port for MQTT over TLS
> +# is 8883, but this must be set manually.
> +#
> +# See also the mosquitto-tls man page.
> +
> +# At least one of cafile or capath must be defined. They both
> +# define methods of accessing the PEM encoded Certificate
> +# Authority certificates that have signed your server certificate
> +# and that you wish to trust.
> +# cafile defines the path to a file containing the CA certificates.
> +# capath defines a directory that will be searched for files
> +# containing the CA certificates. For capath to work correctly, the
> +# certificate files must have ".crt" as the file ending and you must r=
un
> +# "c_rehash <path to capath>" each time you add/remove a certificate.
> +#cafile
> +#capath
> +
> +# Path to the PEM encoded server certificate.
> +#certfile
> +
> +# Path to the PEM encoded keyfile.
> +#keyfile
> +
> +# This option defines the version of the TLS protocol to use for this =
listener.
> +# The default value allows v1.2, v1.1 and v1.0, if they are all suppor=
ted by
> +# the version of openssl that the broker was compiled against. For ope=
nssl >=3D
> +# 1.0.1 the valid values are tlsv1.2 tlsv1.1 and tlsv1. For openssl < =
1.0.1 the
> +# valid values are tlsv1.
> +#tls_version
> +
> +# By default a TLS enabled listener will operate in a similar fashion =
to a
> +# https enabled web server, in that the server has a certificate signe=
d by a CA
> +# and the client will verify that it is a trusted certificate. The ove=
rall aim
> +# is encryption of the network traffic. By setting require_certificate=
 to true,
> +# the client must provide a valid certificate in order for the network=

> +# connection to proceed. This allows access to the broker to be contro=
lled
> +# outside of the mechanisms provided by MQTT.
> +#require_certificate false
> +
> +# If require_certificate is true, you may set use_identity_as_username=
 to true
> +# to use the CN value from the client certificate as a username. If th=
is is
> +# true, the password_file option will not be used for this listener.
> +#use_identity_as_username false
> +
> +# If you have require_certificate set to true, you can create a certif=
icate
> +# revocation list file to revoke access to particular client certifica=
tes. If
> +# you have done this, use crlfile to point to the PEM encoded revocati=
on file.
> +#crlfile
> +
> +# If you wish to control which encryption ciphers are used, use the ci=
phers
> +# option. The list of available ciphers can be optained using the "ope=
nssl
> +# ciphers" command and should be provided in the same format as the ou=
tput of
> +# that command.
> +# If unset defaults to DEFAULT:!aNULL:!eNULL:!LOW:!EXPORT:!SSLv2:@STRE=
NGTH
> +#ciphers DEFAULT:!aNULL:!eNULL:!LOW:!EXPORT:!SSLv2:@STRENGTH
> +
> +# -----------------------------------------------------------------
> +# Pre-shared-key based SSL/TLS support
> +# -----------------------------------------------------------------
> +# The following options can be used to enable PSK based SSL/TLS suppor=
t for
> +# this listener. Note that the recommended port for MQTT over TLS is 8=
883, but
> +# this must be set manually.
> +#
> +# See also the mosquitto-tls man page and the "Certificate based SSL/T=
LS
> +# support" section. Only one of certificate or PSK encryption support =
can be
> +# enabled for any listener.
> +
> +# The psk_hint option enables pre-shared-key support for this listener=
 and also
> +# acts as an identifier for this listener. The hint is sent to clients=
 and may
> +# be used locally to aid authentication. The hint is a free form strin=
g that
> +# doesn't have much meaning in itself, so feel free to be creative.
> +# If this option is provided, see psk_file to define the pre-shared ke=
ys to be
> +# used or create a security plugin to handle them.
> +#psk_hint
> +
> +# Set use_identity_as_username to have the psk identity sent by the cl=
ient used
> +# as its username. Authentication will be carried out using the PSK ra=
ther than
> +# the MQTT username/password and so password_file will not be used for=
 this
> +# listener.
> +#use_identity_as_username false
> +
> +# When using PSK, the encryption ciphers used will be chosen from the =
list of
> +# available PSK ciphers. If you want to control which ciphers are avai=
lable,
> +# use the "ciphers" option.  The list of available ciphers can be opta=
ined
> +# using the "openssl ciphers" command and should be provided in the sa=
me format
> +# as the output of that command.
> +#ciphers
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# Extra listeners
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +# Listen on a port/ip address combination. By using this variable
> +# multiple times, mosquitto can listen on more than one port. If
> +# this variable is used and neither bind_address nor port given,
> +# then the default listener will not be started.
> +# The port number to listen on must be given. Optionally, an ip
> +# address or host name may be supplied as a second argument. In
> +# this case, mosquitto will attempt to bind the listener to that
> +# address and so restrict access to the associated network and
> +# interface. By default, mosquitto will listen on all interfaces.
> +# Note that for a websockets listener it is not possible to bind to a =
host
> +# name.
> +# listener port-number [ip address/host name]
> +#listener
> +
> +# The maximum number of client connections to allow. This is
> +# a per listener setting.
> +# Default is -1, which means unlimited connections.
> +# Note that other process limits mean that unlimited connections
> +# are not really possible. Typically the default maximum number of
> +# connections possible is around 1024.
> +#max_connections -1
> +
> +# The listener can be restricted to operating within a topic hierarchy=
 using
> +# the mount_point option. This is achieved be prefixing the mount_poin=
t string
> +# to all topics for any clients connected to this listener. This prefi=
xing only
> +# happens internally to the broker; the client will not see the prefix=
=2E
> +#mount_point
> +
> +# Choose the protocol to use when listening.
> +# This can be either mqtt or websockets.
> +# Certificate based TLS may be used with websockets, except that only =
the
> +# cafile, certfile, keyfile and ciphers options are supported.
> +#protocol mqtt
> +
> +# When a listener is using the websockets protocol, it is possible to =
serve
> +# http data as well. Set http_dir to a directory which contains the fi=
les you
> +# wish to serve. If this option is not specified, then no normal http
> +# connections will be possible.
> +#http_dir
> +
> +# Set use_username_as_clientid to true to replace the clientid that a =
client
> +# connected with with its username. This allows authentication to be t=
ied to
> +# the clientid, which means that it is possible to prevent one client
> +# disconnecting another by using the same clientid.
> +# If a client connects with no username it will be disconnected as not=

> +# authorised when this option is set to true.
> +# Do not use in conjunction with clientid_prefixes.
> +# See also use_identity_as_username.
> +#use_username_as_clientid
> +
> +# -----------------------------------------------------------------
> +# Certificate based SSL/TLS support
> +# -----------------------------------------------------------------
> +# The following options can be used to enable certificate based SSL/TL=
S support
> +# for this listener. Note that the recommended port for MQTT over TLS =
is 8883,
> +# but this must be set manually.
> +#
> +# See also the mosquitto-tls man page and the "Pre-shared-key based SS=
L/TLS
> +# support" section. Only one of certificate or PSK encryption support =
can be
> +# enabled for any listener.
> +
> +# At least one of cafile or capath must be defined to enable certifica=
te based
> +# TLS encryption. They both define methods of accessing the PEM encode=
d
> +# Certificate Authority certificates that have signed your server cert=
ificate
> +# and that you wish to trust.
> +# cafile defines the path to a file containing the CA certificates.
> +# capath defines a directory that will be searched for files
> +# containing the CA certificates. For capath to work correctly, the
> +# certificate files must have ".crt" as the file ending and you must r=
un
> +# "c_rehash <path to capath>" each time you add/remove a certificate.
> +#cafile
> +#capath
> +
> +# Path to the PEM encoded server certificate.
> +#certfile
> +
> +# Path to the PEM encoded keyfile.
> +#keyfile
> +
> +# By default an TLS enabled listener will operate in a similar fashion=
 to a
> +# https enabled web server, in that the server has a certificate signe=
d by a CA
> +# and the client will verify that it is a trusted certificate. The ove=
rall aim
> +# is encryption of the network traffic. By setting require_certificate=
 to true,
> +# the client must provide a valid certificate in order for the network=

> +# connection to proceed. This allows access to the broker to be contro=
lled
> +# outside of the mechanisms provided by MQTT.
> +#require_certificate false
> +
> +# If require_certificate is true, you may set use_identity_as_username=
 to true
> +# to use the CN value from the client certificate as a username. If th=
is is
> +# true, the password_file option will not be used for this listener.
> +#use_identity_as_username false
> +
> +# If you have require_certificate set to true, you can create a certif=
icate
> +# revocation list file to revoke access to particular client certifica=
tes. If
> +# you have done this, use crlfile to point to the PEM encoded revocati=
on file.
> +#crlfile
> +
> +# If you wish to control which encryption ciphers are used, use the ci=
phers
> +# option. The list of available ciphers can be optained using the "ope=
nssl
> +# ciphers" command and should be provided in the same format as the ou=
tput of
> +# that command.
> +#ciphers
> +
> +# -----------------------------------------------------------------
> +# Pre-shared-key based SSL/TLS support
> +# -----------------------------------------------------------------
> +# The following options can be used to enable PSK based SSL/TLS suppor=
t for
> +# this listener. Note that the recommended port for MQTT over TLS is 8=
883, but
> +# this must be set manually.
> +#
> +# See also the mosquitto-tls man page and the "Certificate based SSL/T=
LS
> +# support" section. Only one of certificate or PSK encryption support =
can be
> +# enabled for any listener.
> +
> +# The psk_hint option enables pre-shared-key support for this listener=
 and also
> +# acts as an identifier for this listener. The hint is sent to clients=
 and may
> +# be used locally to aid authentication. The hint is a free form strin=
g that
> +# doesn't have much meaning in itself, so feel free to be creative.
> +# If this option is provided, see psk_file to define the pre-shared ke=
ys to be
> +# used or create a security plugin to handle them.
> +#psk_hint
> +
> +# Set use_identity_as_username to have the psk identity sent by the cl=
ient used
> +# as its username. Authentication will be carried out using the PSK ra=
ther than
> +# the MQTT username/password and so password_file will not be used for=
 this
> +# listener.
> +#use_identity_as_username false
> +
> +# When using PSK, the encryption ciphers used will be chosen from the =
list of
> +# available PSK ciphers. If you want to control which ciphers are avai=
lable,
> +# use the "ciphers" option.  The list of available ciphers can be opta=
ined
> +# using the "openssl ciphers" command and should be provided in the sa=
me format
> +# as the output of that command.
> +#ciphers
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# Persistence
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +# If persistence is enabled, save the in-memory database to disk
> +# every autosave_interval seconds. If set to 0, the persistence
> +# database will only be written when mosquitto exits. See also
> +# autosave_on_changes.
> +# Note that writing of the persistence database can be forced by
> +# sending mosquitto a SIGUSR1 signal.
> +#autosave_interval 1800
> +
> +# If true, mosquitto will count the number of subscription changes, re=
tained
> +# messages received and queued messages and if the total exceeds
> +# autosave_interval then the in-memory database will be saved to disk.=

> +# If false, mosquitto will save the in-memory database to disk by trea=
ting
> +# autosave_interval as a time in seconds.
> +#autosave_on_changes false
> +
> +# Save persistent message data to disk (true/false).
> +# This saves information about all messages, including
> +# subscriptions, currently in-flight messages and retained
> +# messages.
> +# retained_persistence is a synonym for this option.
> +#persistence false
> +
> +# The filename to use for the persistent database, not including
> +# the path.
> +#persistence_file mosquitto.db
> +
> +# Location for persistent database. Must include trailing /
> +# Default is an empty string (current directory).
> +# Set to e.g. /var/lib/mosquitto/ if running as a proper service on Li=
nux or
> +# similar.
> +#persistence_location
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# Logging
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +# Places to log to. Use multiple log_dest lines for multiple
> +# logging destinations.
> +# Possible destinations are: stdout stderr syslog topic file
> +#
> +# stdout and stderr log to the console on the named output.
> +#
> +# syslog uses the userspace syslog facility which usually ends up
> +# in /var/log/messages or similar.
> +#
> +# topic logs to the broker topic '$SYS/broker/log/<severity>',
> +# where severity is one of D, E, W, N, I, M which are debug, error,
> +# warning, notice, information and message. Message type severity is u=
sed by
> +# the subscribe/unsubscribe log_types and publishes log messages to
> +# $SYS/broker/log/M/susbcribe or $SYS/broker/log/M/unsubscribe.
> +#
> +# The file destination requires an additional parameter which is the f=
ile to be
> +# logged to, e.g. "log_dest file /var/log/mosquitto.log". The file wil=
l be
> +# closed and reopened when the broker receives a HUP signal. Only a si=
ngle file
> +# destination may be configured.
> +#
> +# Note that if the broker is running as a Windows service it will defa=
ult to
> +# "log_dest none" and neither stdout nor stderr logging is available.
> +# Use "log_dest none" if you wish to disable logging.
> +#log_dest stderr
> +
> +# If using syslog logging (not on Windows), messages will be logged to=
 the
> +# "daemon" facility by default. Use the log_facility option to choose =
which of
> +# local0 to local7 to log to instead. The option value should be an in=
teger
> +# value, e.g. "log_facility 5" to use local5.
> +#log_facility
> +
> +# Types of messages to log. Use multiple log_type lines for logging
> +# multiple types of messages.
> +# Possible types are: debug, error, warning, notice, information,
> +# none, subscribe, unsubscribe, websockets, all.
> +# Note that debug type messages are for decoding the incoming/outgoing=

> +# network packets. They are not logged in "topics".
> +#log_type error
> +#log_type warning
> +#log_type notice
> +#log_type information
> +
> +# Change the websockets logging level. This is a global option, it is =
not
> +# possible to set per listener. This is an integer that is interpreted=
 by
> +# libwebsockets as a bit mask for its lws_log_levels enum. See the
> +# libwebsockets documentation for more details. "log_type websockets" =
must also
> +# be enabled.
> +#websockets_log_level 0
> +
> +# If set to true, client connection and disconnection messages will be=
 included
> +# in the log.
> +#connection_messages true
> +
> +# If set to true, add a timestamp value to each log message.
> +#log_timestamp true
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# Security
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +# If set, only clients that have a matching prefix on their
> +# clientid will be allowed to connect to the broker. By default,
> +# all clients may connect.
> +# For example, setting "secure-" here would mean a client "secure-
> +# client" could connect but another with clientid "mqtt" couldn't.
> +#clientid_prefixes
> +
> +# Boolean value that determines whether clients that connect
> +# without providing a username are allowed to connect. If set to
> +# false then a password file should be created (see the
> +# password_file option) to control authenticated client access.
> +# Defaults to true.
> +#allow_anonymous true
> +
> +# In addition to the clientid_prefixes, allow_anonymous and TLS
> +# authentication options, username based authentication is also
> +# possible. The default support is described in "Default
> +# authentication and topic access control" below. The auth_plugin
> +# allows another authentication method to be used.
> +# Specify the path to the loadable plugin and see the
> +# "Authentication and topic access plugin options" section below.
> +#auth_plugin
> +
> +# If auth_plugin_deny_special_chars is true, the default, then before =
an ACL
> +# check is made, the username/client id of the client needing the chec=
k is
> +# searched for the presence of either a '+' or '#' character. If eithe=
r of
> +# these characters is found in either the username or client id, then =
the ACL
> +# check is denied before it is sent to the plugin.o
> +#
> +# This check prevents the case where a malicious user could circumvent=
 an ACL
> +# check by using one of these characters as their username or client i=
d. This
> +# is the same issue as was reported with mosquitto itself as CVE-2017-=
7650.
> +#
> +# If you are entirely sure that the plugin you are using is not vulner=
able to
> +# this attack (i.e. if you never use usernames or client ids in topics=
) then
> +# you can disable this extra check and have all ACL checks delivered t=
o your
> +# plugin by setting auth_plugin_deny_special_chars to false.
> +#auth_plugin_deny_special_chars true
> +
> +# -----------------------------------------------------------------
> +# Default authentication and topic access control
> +# -----------------------------------------------------------------
> +
> +# Control access to the broker using a password file. This file can be=

> +# generated using the mosquitto_passwd utility. If TLS support is not =
compiled
> +# into mosquitto (it is recommended that TLS support should be include=
d) then
> +# plain text passwords are used, in which case the file should be a te=
xt file
> +# with lines in the format:
> +# username:password
> +# The password (and colon) may be omitted if desired, although this
> +# offers very little in the way of security.
> +#
> +# See the TLS client require_certificate and use_identity_as_username =
options
> +# for alternative authentication options.
> +#password_file
> +
> +# Access may also be controlled using a pre-shared-key file. This requ=
ires
> +# TLS-PSK support and a listener configured to use it. The file should=
 be text
> +# lines in the format:
> +# identity:key
> +# The key should be in hexadecimal format without a leading "0x".
> +#psk_file
> +
> +# Control access to topics on the broker using an access control list
> +# file. If this parameter is defined then only the topics listed will
> +# have access.
> +# If the first character of a line of the ACL file is a # it is treate=
d as a
> +# comment.
> +# Topic access is added with lines of the format:
> +#
> +# topic [read|write|readwrite] <topic>
> +#
> +# The access type is controlled using "read", "write" or "readwrite". =
This
> +# parameter is optional (unless <topic> contains a space character) - =
if not
> +# given then the access is read/write.  <topic> can contain the + or #=

> +# wildcards as in subscriptions.
> +#
> +# The first set of topics are applied to anonymous clients, assuming
> +# allow_anonymous is true. User specific topic ACLs are added after a
> +# user line as follows:
> +#
> +# user <username>
> +#
> +# The username referred to here is the same as in password_file. It is=

> +# not the clientid.
> +#
> +#
> +# If is also possible to define ACLs based on pattern substitution wit=
hin the
> +# topic. The patterns available for substition are:
> +#
> +# %c to match the client id of the client
> +# %u to match the username of the client
> +#
> +# The substitution pattern must be the only text for that level of hie=
rarchy.
> +#
> +# The form is the same as for the topic keyword, but using pattern as =
the
> +# keyword.
> +# Pattern ACLs apply to all users even if the "user" keyword has previ=
ously
> +# been given.
> +#
> +# If using bridges with usernames and ACLs, connection messages can be=
 allowed
> +# with the following pattern:
> +# pattern write $SYS/broker/connection/%c/state
> +#
> +# pattern [read|write|readwrite] <topic>
> +#
> +# Example:
> +#
> +# pattern write sensor/%u/data
> +#
> +#acl_file
> +
> +# -----------------------------------------------------------------
> +# Authentication and topic access plugin options
> +# -----------------------------------------------------------------
> +
> +# If the auth_plugin option above is used, define options to pass to t=
he
> +# plugin here as described by the plugin instructions. All options nam=
ed
> +# using the format auth_opt_* will be passed to the plugin, for exampl=
e:
> +#
> +# auth_opt_db_host
> +# auth_opt_db_port
> +# auth_opt_db_username
> +# auth_opt_db_password
> +
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# Bridges
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +# A bridge is a way of connecting multiple MQTT brokers together.
> +# Create a new bridge using the "connection" option as described below=
=2E Set
> +# options for the bridges using the remaining parameters. You must spe=
cify the
> +# address and at least one topic to subscribe to.
> +# Each connection must have a unique name.
> +# The address line may have multiple host address and ports specified.=
 See
> +# below in the round_robin description for more details on bridge beha=
viour if
> +# multiple addresses are used.
> +# The direction that the topic will be shared can be chosen by
> +# specifying out, in or both, where the default value is out.
> +# The QoS level of the bridged communication can be specified with the=
 next
> +# topic option. The default QoS level is 0, to change the QoS the topi=
c
> +# direction must also be given.
> +# The local and remote prefix options allow a topic to be remapped whe=
n it is
> +# bridged to/from the remote broker. This provides the ability to plac=
e a topic
> +# tree in an appropriate location.
> +# For more details see the mosquitto.conf man page.
> +# Multiple topics can be specified per connection, but be careful
> +# not to create any loops.
> +# If you are using bridges with cleansession set to false (the default=
), then
> +# you may get unexpected behaviour from incoming topics if you change =
what
> +# topics you are subscribing to. This is because the remote broker kee=
ps the
> +# subscription for the old topic. If you have this problem, connect yo=
ur bridge
> +# with cleansession set to true, then reconnect with cleansession set =
to false
> +# as normal.
> +#connection <name>
> +#address <host>[:<port>] [<host>[:<port>]]
> +#topic <topic> [[[out | in | both] qos-level] local-prefix remote-pref=
ix]
> +
> +# Set the version of the MQTT protocol to use with for this bridge. Ca=
n be one
> +# of mqttv31 or mqttv311. Defaults to mqttv31.
> +#bridge_protocol_version mqttv31
> +
> +# If a bridge has topics that have "out" direction, the default behavi=
our is to
> +# send an unsubscribe request to the remote broker on that topic. This=
 means
> +# that changing a topic direction from "in" to "out" will not keep rec=
eiving
> +# incoming messages. Sending these unsubscribe requests is not always
> +# desirable, setting bridge_attempt_unsubscribe to false will disable =
sending
> +# the unsubscribe request.
> +#bridge_attempt_unsubscribe true
> +
> +# If the bridge has more than one address given in the address/address=
es
> +# configuration, the round_robin option defines the behaviour of the b=
ridge on
> +# a failure of the bridge connection. If round_robin is false, the def=
ault
> +# value, then the first address is treated as the main bridge connecti=
on. If
> +# the connection fails, the other secondary addresses will be attempte=
d in
> +# turn. Whilst connected to a secondary bridge, the bridge will period=
ically
> +# attempt to reconnect to the main bridge until successful.
> +# If round_robin is true, then all addresses are treated as equals. If=
 a
> +# connection fails, the next address will be tried and if successful w=
ill
> +# remain connected until it fails
> +#round_robin false
> +
> +# Set the client id to use on the remote end of this bridge connection=
=2E If not
> +# defined, this defaults to 'name.hostname' where name is the connecti=
on name
> +# and hostname is the hostname of this computer.
> +# This replaces the old "clientid" option to avoid confusion. "clienti=
d"
> +# remains valid for the time being.
> +#remote_clientid
> +
> +# Set the clientid to use on the local broker. If not defined, this de=
faults to
> +# 'local.<clientid>'. If you are bridging a broker to itself, it is im=
portant
> +# that local_clientid and clientid do not match.
> +#local_clientid
> +
> +# Set the clean session variable for this bridge.
> +# When set to true, when the bridge disconnects for any reason, all
> +# messages and subscriptions will be cleaned up on the remote
> +# broker. Note that with cleansession set to true, there may be a
> +# significant amount of retained messages sent when the bridge
> +# reconnects after losing its connection.
> +# When set to false, the subscriptions and messages are kept on the
> +# remote broker, and delivered when the bridge reconnects.
> +#cleansession false
> +
> +# If set to true, publish notification messages to the local and remot=
e brokers
> +# giving information about the state of the bridge connection. Retaine=
d
> +# messages are published to the topic $SYS/broker/connection/<clientid=
>/state
> +# unless the notification_topic option is used.
> +# If the message is 1 then the connection is active, or 0 if the conne=
ction has
> +# failed.
> +#notifications true
> +
> +# Choose the topic on which notification messages for this bridge are
> +# published. If not set, messages are published on the topic
> +# $SYS/broker/connection/<clientid>/state
> +#notification_topic
> +
> +# Set the keepalive interval for this bridge connection, in
> +# seconds.
> +#keepalive_interval 60
> +
> +# Set the start type of the bridge. This controls how the bridge start=
s and
> +# can be one of three types: automatic, lazy and once. Note that RSMB =
provides
> +# a fourth start type "manual" which isn't currently supported by mosq=
uitto.
> +#
> +# "automatic" is the default start type and means that the bridge conn=
ection
> +# will be started automatically when the broker starts and also restar=
ted
> +# after a short delay (30 seconds) if the connection fails.
> +#
> +# Bridges using the "lazy" start type will be started automatically wh=
en the
> +# number of queued messages exceeds the number set with the "threshold=
"
> +# parameter. It will be stopped automatically after the time set by th=
e
> +# "idle_timeout" parameter. Use this start type if you wish the connec=
tion to
> +# only be active when it is needed.
> +#
> +# A bridge using the "once" start type will be started automatically w=
hen the
> +# broker starts but will not be restarted if the connection fails.
> +#start_type automatic
> +
> +# Set the amount of time a bridge using the automatic start type will =
wait
> +# until attempting to reconnect.  Defaults to 30 seconds.
> +#restart_timeout 30
> +
> +# Set the amount of time a bridge using the lazy start type must be id=
le before
> +# it will be stopped. Defaults to 60 seconds.
> +#idle_timeout 60
> +
> +# Set the number of messages that need to be queued for a bridge with =
lazy
> +# start type to be restarted. Defaults to 10 messages.
> +# Must be less than max_queued_messages.
> +#threshold 10
> +
> +# If try_private is set to true, the bridge will attempt to indicate t=
o the
> +# remote broker that it is a bridge not an ordinary client. If success=
ful, this
> +# means that loop detection will be more effective and that retained m=
essages
> +# will be propagated correctly. Not all brokers support this feature s=
o it may
> +# be necessary to set try_private to false if your bridge does not con=
nect
> +# properly.
> +#try_private true
> +
> +# Set the username to use when connecting to a broker that requires
> +# authentication.
> +# This replaces the old "username" option to avoid confusion. "usernam=
e"
> +# remains valid for the time being.
> +#remote_username
> +
> +# Set the password to use when connecting to a broker that requires
> +# authentication. This option is only used if remote_username is also =
set.
> +# This replaces the old "password" option to avoid confusion. "passwor=
d"
> +# remains valid for the time being.
> +#remote_password
> +
> +# -----------------------------------------------------------------
> +# Certificate based SSL/TLS support
> +# -----------------------------------------------------------------
> +# Either bridge_cafile or bridge_capath must be defined to enable TLS =
support
> +# for this bridge.
> +# bridge_cafile defines the path to a file containing the
> +# Certificate Authority certificates that have signed the remote broke=
r
> +# certificate.
> +# bridge_capath defines a directory that will be searched for files co=
ntaining
> +# the CA certificates. For bridge_capath to work correctly, the certif=
icate
> +# files must have ".crt" as the file ending and you must run "c_rehash=
 <path to
> +# capath>" each time you add/remove a certificate.
> +#bridge_cafile
> +#bridge_capath
> +
> +# Path to the PEM encoded client certificate, if required by the remot=
e broker.
> +#bridge_certfile
> +
> +# Path to the PEM encoded client private key, if required by the remot=
e broker.
> +#bridge_keyfile
> +
> +# When using certificate based encryption, bridge_insecure disables
> +# verification of the server hostname in the server certificate. This =
can be
> +# useful when testing initial server configurations, but makes it poss=
ible for
> +# a malicious third party to impersonate your server through DNS spoof=
ing, for
> +# example. Use this option in testing only. If you need to resort to u=
sing this
> +# option in a production environment, your setup is at fault and there=
 is no
> +# point using encryption.
> +#bridge_insecure false
> +
> +# -----------------------------------------------------------------
> +# PSK based SSL/TLS support
> +# -----------------------------------------------------------------
> +# Pre-shared-key encryption provides an alternative to certificate bas=
ed
> +# encryption. A bridge can be configured to use PSK with the bridge_id=
entity
> +# and bridge_psk options. These are the client PSK identity, and pre-s=
hared-key
> +# in hexadecimal format with no "0x". Only one of certificate and PSK =
based
> +# encryption can be used on one
> +# bridge at once.
> +#bridge_identity
> +#bridge_psk
> +
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# External config files
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +# External configuration files may be included by using the
> +# include_dir option. This defines a directory that will be searched
> +# for config files. All files that end in '.conf' will be loaded as
> +# a configuration file. It is best to have this as the last option
> +# in the main file. This option will only be processed from the main
> +# configuration file. The directory specified must not contain the
> +# main configuration file.
> +#include_dir
> +
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +# rsmb options - unlikely to ever be supported
> +# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +#ffdc_output
> +#max_log_entries
> +#trace_level
> +#trace_output
> diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1=
=2E4.14.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4=
=2E14.bb
> index ea76c36e61..9fea03a5c8 100644
> --- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.b=
b
> +++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.b=
b
> @@ -16,6 +16,7 @@ SRC_URI =3D "http://mosquitto.org/files/source/mosqui=
tto-${PV}.tar.gz \
>             file://0003-makefile-remove-example-files-from-installation=
=2Epatch \
>             file://mosquitto.service \
>             file://mosquitto.init \
> +           file://mosquitto.conf \
>  "
> =20
>  SRC_URI[md5sum] =3D "6b0966e93f118bc71ad7b61600a6c2d3"
> @@ -49,6 +50,7 @@ do_install() {
>      install -m 0644 ${WORKDIR}/mosquitto.service ${D}${systemd_unitdir=
}/system/
> =20
>      install -d ${D}${sysconfdir}/mosquitto
> +    install -m 0644 ${WORKDIR}/mosquitto.conf ${D}${sysconfdir}/mosqui=
tto/mosquitto.conf
> =20
>      install -d ${D}${sysconfdir}/init.d/
>      install -m 0755 ${WORKDIR}/mosquitto.init ${D}${sysconfdir}/init.d=
/mosquitto
> @@ -76,6 +78,8 @@ FILES_${PN}-clients =3D "${bindir}/mosquitto_pub \
>                         ${bindir}/mosquitto_sub \
>  "
> =20
> +CONFFILES_${PN} =3D "${sysconfdir}/mosquitto"
> +
>  SYSTEMD_SERVICE_${PN} =3D "mosquitto.service"
> =20
>  INITSCRIPT_NAME =3D "mosquitto"
>=20



--ghz2rsIUiS3sGHAPdLvmteIEML6YmHOIj--

--fkG1KPbbbWLHeNb9H4VZRHwDLYqwKfpwS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWxF2fAAKCRC7BTNVkZ0z
FMexAJ4q8d1kiyg/G6ifxfaEFzwGKkRUbwCfWN8AQ81rkgyhACxNHEoS74YSSMA=
=Jw4f
-----END PGP SIGNATURE-----

--fkG1KPbbbWLHeNb9H4VZRHwDLYqwKfpwS--
