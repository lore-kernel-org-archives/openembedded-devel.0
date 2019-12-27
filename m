Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id CCCD371B99
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 10:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577444130; x=1608980130;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=RTelF+bMdVi+AViEeG/3wR2BPH26hV+F+BbSitsQFvs=;
	b=ombF5GmmrID0hABwIH1Pp17ve61E4xH1zKGUIHwPTqCNTQyC+FwrHBRo
	my0L8XtYEpcs7gZQ4vh15bOdxKiO2gazRSj9WAjgw9hG071EZoT1zlSkh
	F2wEss7KhYLiYhAvnvNn1kxziIWVxtvqI20yUSzDK7kDTBqoQopJ5TAT0
	BfzHyT/TrBVBD1u57+GLthzRaYXaXXtzi5U3l2fLWa0gDzg6gKwvLBsWw
	uHBOc1yXo4O3b1z7x82rS7xP07YT14gHC4kYcpbu0vh9bRlmXXsIJh/TI
	nMBG19GkhY29L97RbhJQThG5rqiaJuWE3bi0U87m/4qiXKApWs3Q65UHi Q==;
IronPort-SDR: rRvGWJCwOjCg7LXkEua7ZeC6t35tLa1adPFdphnx0QrzMAfpHxP1SCY9xx3oB+/ZNTt/G4ll4s
	/LNSUfWdBAst3N8MkZBKMH/7Y5uHJEkwzse3UoKzwLA1k/OX2H7vtlJjC/mPRM+88S03Lyxdyk
	zrzLKJsa+hHmZTVtoggF4CYi/+DiwCbhHV/iGyvlHcnkhX9PEryyKG6PgPJnJ8Z3cWTqW9H52c
	S3xeyNURU0CT5owmUfIZsQ509crsT8SGoCxM6hHPI8dQcx8HHwEx7oDtlBFkjQeT4ooI5ietZF
	Oj0=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; 
   d="scan'208";a="2472755"
To: Jacob Kroon <jacob.kroon@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20191212120054.3736-1-jacob.kroon@gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <8c0a31d6-7612-8599-199f-6b209aed4ceb@skidata.com>
Date: Fri, 27 Dec 2019 11:55:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191212120054.3736-1-jacob.kroon@gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] cacao: Use python3 in java wrapper script
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
X-List-Received-Date: Fri, 27 Dec 2019 10:55:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
      git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 12/12/2019 13:00, Jacob Kroon wrote:
> OE-Core has dropped python2 so switch to using python3.
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>   .../cacao-1.6.1-do-not-rely-on-absolute-paths.patch           | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch b/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
> index 2b046cf..665377b 100644
> --- a/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
> +++ b/recipes-core/cacao/cacao-2d6f6c14daf9/cacao-1.6.1-do-not-rely-on-absolute-paths.patch
> @@ -27,8 +27,8 @@ index 0790f02..2118de7 100644
>   +
>   +# if this shell script is invoked through symlink, we get invalid paths. As getting the real path to this file is
>   +# very painful using only /bin/sh, python is used instead.
> -+PYTHON_STR="import os; print os.path.dirname(os.path.realpath(os.readlink(\"${CURRENT_DIR}/java\"))) if os.path.islink(\"${CURRENT_DIR}/java\") else \"${CURRENT_DIR}\""
> -+REAL_DIR=`python -c "${PYTHON_STR}"`
> ++PYTHON_STR="import os; print(os.path.dirname(os.path.realpath(os.readlink(\"${CURRENT_DIR}/java\"))) if os.path.islink(\"${CURRENT_DIR}/java\") else \"${CURRENT_DIR}\")"
> ++REAL_DIR=`python3 -c "${PYTHON_STR}"`
>   +
>   +PARENT_DIR=`dirname ${REAL_DIR}`
>   +
> 

