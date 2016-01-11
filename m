Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 5C002731D3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 18:06:19 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id 7D60328003E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 19:06:20 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <1452534832-3203-1-git-send-email-mike.looijmans@topic.nl>
	<1D770D53-86F4-45AA-9515-0A2F9538575F@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <5693EF1C.5090500@topic.nl>
Date: Mon, 11 Jan 2016 19:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1D770D53-86F4-45AA-9515-0A2F9538575F@gmail.com>
Subject: Re: [meta-networking][PATCH] recipes-connectivity/samba: Only rmdir directories that exist
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
X-List-Received-Date: Mon, 11 Jan 2016 18:06:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 11-01-16 19:00, Khem Raj wrote:
>
>> On Jan 11, 2016, at 9:53 AM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>
>> Depending on PACKAGECONFIG selection, the /run/samba directory may not
>> have been created. Make the do_install_append handle both situations
>> by checking whether these directories exist before attempting to remove
>> them.
>>
>> This fixes do_install failing with an error like this:
>> rmdir: failed to remove '/.../samba/4.1.12-r0/image/run/samba': No such file or directory
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>> meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>> index a51d31f..8e89e49 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
>> @@ -104,8 +104,12 @@ EXTRA_OECONF += "--enable-fhs \
>> LDFLAGS += "-Wl,-z,relro,-z,now"
>>
>> do_install_append() {
>> -    rmdir --ignore-fail-on-non-empty "${D}/run/samba"
>> -    rmdir --ignore-fail-on-non-empty "${D}/run"
>> +    if [ -d "${D}/run" ]; then
>> +        if [ -d "${D}/run/samba" ]; then
>> +            rmdir --ignore-fail-on-non-empty "${D}/run/samba"
>> +        fi
>> +        rmdir --ignore-fail-on-non-empty "${D}/run"
>> +    fi
>
> why don’t we delete /run completely ? it won’t work if package contents are in there anyway
>

That's what I do in a bbappend, just "rm -rf ${D}/run" (and also replace 
the non-functional startup script, but that's distro specific), but I 
thought that it might serve some purpose for the one who wrote the recipe.

/run is usually volatile, so putting files in there is pointless, right?

