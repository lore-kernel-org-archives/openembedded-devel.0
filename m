Return-Path: <riku.voipio@linaro.org>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0C6916101C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 19:22:30 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id m20so4024393qcx.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 12:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=NcnM2KK/IcXhg75/V8GS/N4dBzGaMu+YwhMQxDFImNs=;
	b=lODX5f6U6NEddYmNLVFW0sG2eSRYG1VdmY0gIcEFjGItaDZ0HeiYzU2iz1q3M8vpT4
	ZTO0XrunfYxofpIgSJ7z01Nsjf8gU9qGS5jmdblBNnGljZey4BB4fSxAK1CibWOuXEbt
	Y04BxmwK6qhrqAXrwWNUKwgkCm9/AHxJPZ0330/0fD9hVfyOWJKFHeD+UUosGQsjutD5
	Lmc6cyAYt7EE2f6L3FRp/cPlLcVQVpu9/p0y0v6gax81wQ00NtpT6EKqvA+fC3PIqxnn
	iV3D2qyFdWsQYzxBPFNMLO8X0PBH8UfBZ6q5Ad4TNZdECX3P7xWMkpGJKY6TYM7wzTqF
	aFug==
X-Gm-Message-State: ALoCoQnRB0IvBoSSpbKCFOGjjxBuODPaD9cj+m0kR2N3syXL+pFq6ZdbmfDrf6tKkWOkP+e2F4gW
MIME-Version: 1.0
X-Received: by 10.224.69.69 with SMTP id y5mr16154704qai.53.1380568952410;
	Mon, 30 Sep 2013 12:22:32 -0700 (PDT)
Received: by 10.49.71.232 with HTTP; Mon, 30 Sep 2013 12:22:32 -0700 (PDT)
In-Reply-To: <20130930155838.08e5f9d4@e6520eb>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
	<1380548771-13812-3-git-send-email-riku.voipio@linaro.org>
	<20130930155838.08e5f9d4@e6520eb>
Date: Mon, 30 Sep 2013 22:22:32 +0300
Message-ID: <CAAqcGHnxp2nk2YfkBahTGkawurdj-sZ=SJVRopPL=qZO5PW9hw@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Cc: openembedded-devel@lists.openembedded.org,
	Patch Tracking <patches@linaro.org>
Subject: Re: [meta-java][PATCH 3/3] jamvm/java: allow spaces in arguments
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
X-List-Received-Date: Mon, 30 Sep 2013 19:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 30 September 2013 16:58, Eric B=E9nard <eric@eukrea.com> wrote:
> Hi Riku,
>
> Le Mon, 30 Sep 2013 16:46:11 +0300,
> Riku Voipio <riku.voipio@linaro.org> a =E9crit :
>
>> Current IFS mangling blows up on the face:
>>
>>     | configure:2341: javac  -classpath .: Test.java
>>     | Invalid maximum heap size: -Xmx1024m-cp/srv/oe/b
>>
>> Simpler command line expansion works just as easy.
>> ---
>>  recipes-core/jamvm/files/java | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-core/jamvm/files/java b/recipes-core/jamvm/files/ja=
va
>> index 27cf094..9a396a7 100755
>> --- a/recipes-core/jamvm/files/java
>> +++ b/recipes-core/jamvm/files/java
>> @@ -1,6 +1,5 @@
>>  #!/bin/sh
>>
>> -IFS=3D""
>> -export LD_LIBRARY_PATH=3D"$LD_LIBRARY_PATH:STAGING_LIBDIR_NATIVE/classp=
ath:STAGING_LIBDIR_NATIVE/jamvm"
>> -export BOOTCLASSPATH=3D"STAGING_DATADIR_NATIVE/jamvm/classes.zip:STAGIN=
G_DATADIR_NATIVE/classpath/glibj.zip"
>> -exec jamvm ${1+"$@"}
>> +export LD_LIBRARY_PATH=3D"$LD_LIBRARY_PATH:/srv/oe/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/classpath:/srv/oe/build/tmp-eglibc/sysroots/x86_=
64-linux/usr/lib/jamvm"
>> +export BOOTCLASSPATH=3D"/srv/oe/build/tmp-eglibc/sysroots/x86_64-linux/=
usr/share/jamvm/classes.zip:/srv/oe/build/tmp-eglibc/sysroots/x86_64-linux/=
usr/share/classpath/glibj.zip"
>> +exec jamvm "$@"

> so now we have your path "/srv/oe/build/tmp-eglibc/" hardcoded in the
> recipe ;-)

That is indeed not intended.. I was a bit uncertain with this patch,
as it was not clear to me why the IFS setting was needed.

Riku

