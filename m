Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TTXLI-0008IC-JG
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2012 13:24:20 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so846527pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2012 05:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=6jnm/X1lQ5yDsP7+S9bN+woI9zmQMZ/vxrya47Ng/4c=;
	b=KK0gDgOkQJwG1Tc472dv1MuTr8e/M2rgm2obrFSwXCQlp1kVhBsQyjipjwpy3YfmrU
	tyg4L2bE5oZ33PDXxivpEwZritbCcMz4N00TxmBscmx6rXTyi9WVrdYJ9zMUA+qe+tKj
	wOq3jN173cAYpTEALgi+pXP7rpz9E0eDIn3tuI6WjQRC385E7V3YN9wJF3kVtD8AYI/a
	PRSHmVzQcXKP4n7bz51SGnQCVq/Su5DMW6pabbuTwnKLviZ3DlfSWdN/EcKMkX9gPouD
	19eCa4JREispPor4OXUwmRStIdKQah++RF2sF9cUS2J9R8Qi+6e5jo9ZUU4yB1hPajJT
	eJJQ==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr3996770pbc.33.1351685443131; Wed,
	31 Oct 2012 05:10:43 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 31 Oct 2012 05:10:43 -0700 (PDT)
In-Reply-To: <22912476.o0gAnAerSU@helios>
References: <1351684903-1276-1-git-send-email-otavio@ossystems.com.br>
	<22912476.o0gAnAerSU@helios>
Date: Wed, 31 Oct 2012 10:10:43 -0200
X-Google-Sender-Auth: i2vtM7ofEakS_-vHMq1ShJArx94
Message-ID: <CAP9ODKoHazKxG-DvsVMPLHv-nn=ipJaifjWy76v108dCXoDF1g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] meta-systemd: ntp: Fix ntpdate.service file to use right binary
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 12:24:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 31, 2012 at 10:07 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 31 October 2012 10:01:43 Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  .../recipes-support/ntp/ntp/ntpdate.service        |    2 +-
>>  .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |    2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
>> b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
>> index b2bc632..8df9970 100644
>> --- a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
>> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
>> @@ -4,7 +4,7 @@ Before=ntpd.service
>>
>>  [Service]
>>  Type=oneshot
>> -ExecStart=/usr/bin/ntpd -q -g -x
>> +ExecStart=/usr/bin/ntpdate pool.ntp.org
>
> We *cannot* use pool.ntp.org for the reasons already discussed.

Do you have a pointer for this discussion?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


