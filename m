Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id A14DD712AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Sep 2014 17:51:46 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id q200so7780840ykb.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Sep 2014 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=39fli/bBKbBpE+UM01ViQ1ivRu/mzm8CBUUgNSzWt+0=;
	b=Rj+h/GxY11vstVG80kotWyUkm2/5yWWXhismiQVgK4HFp8MsPx6Ut5eB7iuYiBw7t+
	NWcf96DHyE7gehCGkXLw2pldjh/xomssVybvNRg4XcVIhVwcGnPE0jmxU75qkXKBQuqj
	Dpesou+Mv1Vry3emMjOOvFHS1uYI39z+Z66OWo6+key96RtF4/PujnkN01D85bBzE8sU
	9pGHj44rGZaHuUv3DHWDVn2px2uhPKPY+gH/WZTQnslhx48Y3v6SG3vxWIpuCBYVFYWX
	rwwpf6bMY0f0pLR0GtQGhWI2uouzQ822awUOUg9A6IpVucHFa6eA7Q6T217ll91rLQ35
	/StQ==
MIME-Version: 1.0
X-Received: by 10.236.157.134 with SMTP id o6mr26487227yhk.92.1410025907295;
	Sat, 06 Sep 2014 10:51:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Sat, 6 Sep 2014 10:51:47 -0700 (PDT)
In-Reply-To: <CALRGHr_OiFeW60BsKxe0XdrBbkcXAE+usv3-=pHnhXCzONK_vg@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
	<CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
	<CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
	<CALRGHr_OiFeW60BsKxe0XdrBbkcXAE+usv3-=pHnhXCzONK_vg@mail.gmail.com>
Date: Sat, 6 Sep 2014 14:51:47 -0300
X-Google-Sender-Auth: Rk9dw86fVUhBfIq7r7xxOjromuE
Message-ID: <CAP9ODKoBFp7Pskwch4nLq4mkJOB-uFh1m2w7zz46LZ=CUp5JAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Error while bitbake meta-toolchain-qt5
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
X-List-Received-Date: Sat, 06 Sep 2014 17:51:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Sep 6, 2014 at 12:55 AM, Switesh Fulpagare
<switesh.fulpagare@mindastoneridge.com> wrote:
> Hi Otavio,
>      Thanks for your mail.
> Yes, Otavio you are right.
> There is  / at the end of DL_DIR in the local.conf file.
> I had removed that and once again given bitbake meta-toolchain-qt5
> but as result as earlier. See the link below.
>
> http://pastebin.com/a8VjfKXh

WARNING: Failed to fetch URL
git://qt.gitorious.org/qt/qtwayland.git;branch=stable, attempting
MIRRORS if available
ERROR: Fetcher failure: Unable to find revision
a237778666666ab77c4e8e6b501cf0fbe7c9223e in branch stable even from
upstream
ERROR: Function failed: Fetcher failure for URL:
'git://qt.gitorious.org/qt/qtwayland.git;branch=stable'. Unable to
fetch URL from any source.

It seems you didn't apply the patch.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

