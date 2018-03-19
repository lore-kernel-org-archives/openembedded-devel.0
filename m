Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 79D7178262
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Ji5STGH01x1EeGsickU1WAbn0kefp1IdicPgULAZ2sA=; 
	b=OUgTi+3e7Vj2rHWwyPT/sX96TZXB/+TdiuS9s6ixuRNsgINemYUICSidi7yH4hR+z0ZZ+Ym7rFpncY4WQlcSRISYNpkswyJgteea4G08rGyyy75+r/+hw6bSnyx9Dz29Hg8D4Kv/DpXBmVl8Dkplxps5OAsnXQceKQ03UR0W09dKtWIaFPZnTt1SZMXgzWFNpRrVjvbwFe7svfyLKsXpaSgK5lcUcK22EYAzLcGB8geWjgAkHKXo9DqvGGeN4oWznGkhqCANzLgXP/p8R5d1fvrvZNoND9KqYQvcDdgaALQmkk/LXcB7KlDjwI51V84fTZocdZkHdOkwb0YtHgfEMg==;
Received: from [192.168.10.146] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1exv5A-0004Au-Hy; Mon, 19 Mar 2018 14:44:12 +0100
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20180313222055.47545-1-psaavedra@igalia.com>
	<CALbNGRRU1BZis6nTNj_q+gGX1nzvKCxjYpM_Sk7vdcK3km79Gw@mail.gmail.com>
From: Pablo Saavedra <psaavedra@igalia.com>
Message-ID: <9c3a5a1f-9b3a-4eb2-c19e-08518b32edc5@igalia.com>
Date: Mon, 19 Mar 2018 14:44:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRRU1BZis6nTNj_q+gGX1nzvKCxjYpM_Sk7vdcK3km79Gw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] networkmanager upgrade to 1.10.6
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
X-List-Received-Date: Mon, 19 Mar 2018 13:44:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Andreas,

On 15/03/18 15:33, Andreas Müller wrote:
>> @@ -49,6 +44,7 @@ EXTRA_OECONF = " \
>>      --disable-ifcfg-rh \
>>      --disable-ifnet \
>>      --disable-ifcfg-suse \
>> +    --disable-introspection \
> ^ Why disable introspection?
>>      --disable-more-warnings \
>>      --with-iptables=${sbindir}/iptables \
>>      --with-tests \

NM fails in configuration time if `--enable-introspection` ins enabled.
Configure fails in L1290:

        if ! "$PYTHON" -c 'from gi.repository import GObject' >&
/dev/null; then
                AC_MSG_ERROR(["--enable-introspection aims to build the
settings documentation. This requires GObject introspection for python
(pygobject)])
        fi

The execution of GObject check in the native environment causes this
exception:

    $PYTHON -c 'from gi.repository import GObject'
    Traceback (most recent call last):
     File "<frozen importlib._bootstrap>", line 890, in _find_spec
    AttributeError: 'DynamicImporter' object has no attribute 'find_spec'

    During handling of the above exception, another exception occurred:

    Traceback (most recent call last):
      File "<string>", line 1, in <module>
      File
"/home/igalia/psaavedra/yocto/build/tmp/work/i586-poky-linux/networkmanager/1.10.6-r0/recipe-sysroot-native/usr/lib/python3.5/site-packages/gi/importer.py",
line 127, in find_module
        'introspection typelib not found' % namespace)
    ImportError: cannot import name GObject, introspection typelib not found


I tried to add these depends:

    python3-pygobject \
    python3-pygobject-native \

with no success.


I didn't find any examples of similar solution for this issues. Only I
found a unreplied email with this very similar issue, so any suggestion
is welcome to make a good fix.

Alternatively, since the introspection is interesting as a run depends
for D-Bus discovery, WDYT about patch the `configure.ac` in order to
skip this failing assertion but adding an explicit RDEPEND with
python3-pygobject in the recipe?


[1] https://lists.yoctoproject.org/pipermail/poky/2017-December/011190.html

