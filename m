Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id CD8C26BC1F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2014 18:01:35 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id uy5so15535462obc.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2014 10:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sXwbCQowI83IJNDsgsRVwdzPTnASZNE/BzrxtmcTVjg=;
	b=iBPMJhxr14dqZOVtED7ICrTW70WEIwjB5u4+n3NXlCO9wEXm3Fg/94sXKiptqZkl3F
	q28QS+LSXQ7DzHwE30neowdehOoMj/Nl/J7NOR1ITGVrGcrvGFkApVT62R24woUysuQf
	nJvO9xSSToT9FcC7ndQBzezRL1+WjWs3UOxWiOK8jfxhLGPkYB72KOnfQaoTHfhQAIiV
	ibLEh7kFDwLBYw3xv6Gbk94Hi2RJ8NhRIBlfpngtJVQnH8M5YpFhLXFTSe6eiONUnECM
	RJaeRPEf3+1Qxn/5fE4tyTmhITKxSqULUkdKOwNhGlQLauSoQklo83kgWH3/htj/KJ7H
	aZWQ==
MIME-Version: 1.0
X-Received: by 10.60.34.3 with SMTP id v3mr1226351oei.67.1388772096421; Fri,
	03 Jan 2014 10:01:36 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 3 Jan 2014 10:01:36 -0800 (PST)
In-Reply-To: <20140101123625.GC11840@jama>
References: <1387240261-7045-1-git-send-email-otavio@ossystems.com.br>
	<1387240261-7045-4-git-send-email-otavio@ossystems.com.br>
	<20140101123625.GC11840@jama>
Date: Fri, 3 Jan 2014 16:01:36 -0200
X-Google-Sender-Auth: LOCMK_IQddFXbCQvSbaedf-JCaM
Message-ID: <CAP9ODKoxN6pb3JvjzY7x8NPmDj2U0jVtsUgYxrgdx7ney5J2cw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH v2 4/6] gdal: Add recipe for 1.10.1 version
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
X-List-Received-Date: Fri, 03 Jan 2014 18:01:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Martin,

On Wed, Jan 1, 2014 at 10:36 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Dec 16, 2013 at 10:30:59PM -0200, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> Changes in v2: None
>
> Please fix following error detected in:
> http://jenkins.nas-admin.org/job/oe_shr-image-all_tmpfs_qemuarm/173/consoleFull
>
> ERROR: This autoconf log indicates errors, it looked at host include
> and/or library paths while determining system capabilities.
> Rerun configure task after fixing this. The path was
> '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gdal/1.10.1-r0/gdal-1.10.1'
> ERROR: Function failed: do_qa_configure
> ERROR: Logfile of failure stored in:
> /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/gdal/1.10.1-r0/temp/log.do_configure.883
> NOTE: recipe gdal-1.10.1-r0: task do_configure: Failed
> ERROR: Task 14201
> (/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb,
> do_configure) failed with exit code '1'

Can you send me the full log? I failed to identify  what causes it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

