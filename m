Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 31D6C60797
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jun 2016 14:38:18 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id a5so39159780ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2016 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7/tpWFsDc0oFIK98doLs22GQ0Z+U9HGsoZaoSQC35sQ=;
	b=tNX5zweW/vscJyh3FMHUpJum7jimCdi/XZp5lAUOgDFxvuvAATvjRa4Ac8C2xLX+gd
	XgMkwwqf4AiYGLahQAhG41uxkb9zeHHm+UQUHdtkZjScB2fWtQtXXuhVRwl0K3vq5taF
	QWEuTIEtnQmyRrmuQcC57dcAqTPeS1aPa24g1jItwIFfjNj9hpH3p782qA191sybCjLL
	mv1NfT+KX4zxVm93gQOzUcIoq3EpvkctYPn6+O9G5wt0BSVsJZ6E+QbpzxJnodPxucLS
	LM1LvKhTrijaCQSwYrS/NaLoaeMY1D7c9jWfUOrMoxc1laNuU+T1mL5Qn87MyQ2q/iwO
	tUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7/tpWFsDc0oFIK98doLs22GQ0Z+U9HGsoZaoSQC35sQ=;
	b=mXa2R2r1kLhltvAMjCohqECzhKFne6ewfwp9VPzxmecGArTtI7qCRRllf39E6VhuFs
	zfHgtxySLbK+cKiYV+NLA89cJEvnt1rz4wq0TmSj9gesL3IT2kZDSukwjAI67XiIGHT7
	wUSrtKIu3Mad1Sv65H7akdHDVqvNTc9GgITu0JXiLB9UqeUfrbS2kqQZV5IukfEzn/Tb
	c25BbHJ+FTqNwkH+e4wK+8TOQIqtr762OeLa8j0FveTl6ylwxpsbMd+vVC1rLFidnH0W
	1xf1050LAGxnoo3cNVTp6RZsWA5Zc9pcIMNtXwPNa1ZW877W86B06NpClS2zd9F/Am+T
	3xxw==
X-Gm-Message-State: ALyK8tIcdC/3ZHVyxhqgrm0sCp3sQivixBXK9T1kwjC14+uRcCxQ3OMxKDy2ThT+75FPKa3Uz0j0UBDVyhkbMTPL
X-Received: by 10.36.120.193 with SMTP id p184mr22893182itc.22.1465483099390; 
	Thu, 09 Jun 2016 07:38:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 9 Jun 2016 07:37:59 -0700 (PDT)
In-Reply-To: <c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jun 2016 15:37:59 +0100
Message-ID: <CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
To: Philip Balister <philip@balister.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] the fate of Vala in OE
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
X-List-Received-Date: Thu, 09 Jun 2016 14:38:19 -0000
Content-Type: text/plain; charset=UTF-8

On 9 June 2016 at 15:08, Philip Balister <philip@balister.org> wrote:

> That said, what other layers use vala? If it leaves core, is there a
> layer that can host it and support other layers using it without to much
> trouble?
>

That's the key question really - can the support be extracted and added to
eg meta-vala in some way?

Ross

