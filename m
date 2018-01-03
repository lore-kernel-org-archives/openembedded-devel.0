Return-Path: <philip@balister.org>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Jan 2018 15:56:20 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id D496A6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 15:56:20 +0000 (UTC)
Received: (qmail 25293 invoked by uid 1003); 3 Jan 2018 15:49:40 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.109.186)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	3 Jan 2018 15:49:39 -0000
To: Derek Straka <derek@asterius.io>, Yi Zhao <yi.zhao@windriver.com>
References: <1514941115-27329-1-git-send-email-yi.zhao@windriver.com>
	<CADNbA1pszSeHvab_oNg9MzqNz4owuxcGc2jZWBWBKjDeiv9Fkw@mail.gmail.com>
	<fa40d465-6b8a-1cee-00ed-c349d30ae0a7@windriver.com>
	<CADNbA1qBnd-szzOfajLv0ADkpEf=HH=bL5RkGzJjBWBBJ52AqA@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <0e15500b-cb21-4a4b-a2d0-23b486906e48@balister.org>
Date: Wed, 3 Jan 2018 10:49:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CADNbA1qBnd-szzOfajLv0ADkpEf=HH=bL5RkGzJjBWBBJ52AqA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] stat: add the recipe from oe-core
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
X-List-Received-Date: Wed, 03 Jan 2018 15:56:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit

On 01/02/2018 08:47 PM, Derek Straka wrote:
> Makes sense.  I'm all for letting someone add it back if they'd like to use
> it over coreutils (understanding that it isn't maintained), but we can let
> others chime in.

meta-oe is not a place to dump recipes for unmaintained software. The
recipe will end up failing, getting blacklisted and removed. Let's save
the maintainers time. If someone needs it that badly, let them carry it
in their own layer.

Philip

> 
> -Derek
> 
> On Tue, Jan 2, 2018 at 8:38 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
> 
>>
>>
>> 在 2018年01月03日 09:20, Derek Straka 写道:
>>
>> Is there any compelling reason to include it in meta-oe at all?  It seems
>> like dropping it altogether would be a better approach.
>>
>>
>> I have no objection  to drop it. But I'm not sure if someone else use it
>> ...
>>
>> Yi
>>
>>
>>
>> -Derek
>>
>> On Tue, Jan 2, 2018 at 7:58 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
>>
>>> The stat hasn't any update since 2002. All modern Linux distributions
>>> use stat from coreutils as default. It is no longer needed by oe-core.
>>> Move it to meta-oe.
>>>
>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>> ---
>>>  .../stat/stat-3.3/fix-error-return.patch           | 16 +++++
>>>  .../stat/stat-3.3/fix-security-format.patch        | 68
>>> ++++++++++++++++++++++
>>>  meta-oe/recipes-extended/stat/stat_3.3.bb          | 35 +++++++++++
>>>  3 files changed, 119 insertions(+)
>>>  create mode 100644 meta-oe/recipes-extended/stat/
>>> stat-3.3/fix-error-return.patch
>>>  create mode 100644 meta-oe/recipes-extended/stat/
>>> stat-3.3/fix-security-format.patch
>>>  create mode 100644 meta-oe/recipes-extended/stat/stat_3.3.bb
>>>
>>> diff --git a/meta-oe/recipes-extended/stat/stat-3.3/fix-error-return.patch
>>> b/meta-oe/recipes-extended/stat/stat-3.3/fix-error-return.patch
>>> new file mode 100644
>>> index 0000000..032995d
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/stat/stat-3.3/fix-error-return.patch
>>> @@ -0,0 +1,16 @@
>>> +This patch fixies the wrong return code of stat -h.
>>> +
>>> +Upstream-Status: Pending
>>> +Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
>>> +
>>> +--- stat-3.3/stat.c.orig       2013-08-22 10:49:45.000000000 +0800
>>> ++++ stat-3.3/stat.c    2013-08-22 10:50:31.000000000 +0800
>>> +@@ -845,7 +845,7 @@
>>> +     fprintf(stderr, "\t\t%%S - Security ID in SE-Linux\n");
>>> +     fprintf(stderr, "\t\t%%C - Security context in SE-Linux\n");
>>> +     fprintf(stderr, "\t\t%%d - Free file nodes in file system\n");
>>> +-    exit(1);
>>> ++    exit(0);
>>> + }
>>> +
>>> +
>>> diff --git a/meta-oe/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>> b/meta-oe/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>> new file mode 100644
>>> index 0000000..0c01ed0
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/stat/stat-3.3/fix-security-format.patch
>>> @@ -0,0 +1,68 @@
>>> +stat: Fixing security formatting issues
>>> +
>>> +Fix security formatting issues related to printf without NULL argument
>>> +
>>> +stat.c: In function 'print_human_access':
>>> +stat.c:292:13: error: format not a string literal and no format
>>> arguments [-Werror=format-security]
>>> +     printf (access);
>>> +             ^
>>> +stat.c: In function 'print_human_time':
>>> +stat.c:299:57: error: format not a string literal and no format
>>> arguments [-Werror=format-security]
>>> +   if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
>>> +                                                         ^
>>> +stat.c: In function 'print_it':
>>> +stat.c:613:6: error: format not a string literal and no format arguments
>>> [-Werror=format-security]
>>> +      printf(b);
>>> +      ^
>>> +stat.c:642:6: error: format not a string literal and no format arguments
>>> [-Werror=format-security]
>>> +      printf(b);
>>> +      ^
>>> +
>>> +[YOCTO #9550]
>>> +[https://bugzilla.yoctoproject.org/show_bug.cgi?id=9550]
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>>> +
>>> +diff --git a/stat.c b/stat.c
>>> +index 1ed07a9..2be6f62 100644
>>> +--- a/stat.c
>>> ++++ b/stat.c
>>> +@@ -289,15 +289,15 @@ void print_human_access(struct stat *statbuf)
>>> +     default:
>>> +       access[0] = '?';
>>> +     }
>>> +-    printf (access);
>>> ++    fputs(access,stdout);
>>> + }
>>> +
>>> + void print_human_time(time_t *t)
>>> + {
>>> +   char str[40];
>>> +
>>> +-  if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
>>> +-  else printf("Cannot calculate human readable time, sorry");
>>> ++  if (strftime(str, 40, "%c", localtime(t)) > 0) fputs(str,stdout);
>>> ++  else fputs("Cannot calculate human readable time, sorry",stdout);
>>> + }
>>> +
>>> + /* print statfs info */
>>> +@@ -610,7 +610,7 @@ void print_it(char *masterformat, char *filename,
>>> +       {
>>> +           strcpy (pformat, "%");
>>> +           *m++ = '\0';
>>> +-          printf(b);
>>> ++          fputs(b,stdout);
>>> +
>>> +           /* copy all format specifiers to our format string */
>>> +           while (isdigit(*m) || strchr("#0-+. I", *m))
>>> +@@ -639,7 +639,7 @@ void print_it(char *masterformat, char *filename,
>>> +       }
>>> +       else
>>> +       {
>>> +-          printf(b);
>>> ++          fputs(b,stdout);
>>> +           b = NULL;
>>> +       }
>>> +     }
>>> diff --git a/meta-oe/recipes-extended/stat/stat_3.3.bb
>>> b/meta-oe/recipes-extended/stat/stat_3.3.bb
>>> new file mode 100644
>>> index 0000000..8ac8e89
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/stat/stat_3.3.bb
>>> @@ -0,0 +1,35 @@
>>> +SUMMARY = "Command line file status display utility"
>>> +HOMEPAGE = "http://www.ibiblio.org/pub/Linux/utils/file/"
>>> +DESCRIPTION = "Displays all information about a file that the stat()
>>> call provides and all information about a filesystem that statfs()
>>> provides."
>>> +SECTION = "console/utils"
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631
>>> \
>>> +                    file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f"
>>> +
>>> +SRC_URI = "http://www.ibiblio.org/pub/Linux/utils/file/${BP}.tar.gz \
>>> +           file://fix-security-format.patch \
>>> +           file://fix-error-return.patch"
>>> +
>>> +SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
>>> +SRC_URI[sha256sum] = "7071f0384a423a938dd542c1f0854
>>> 7a02824f6359acd3ef3f944b2c4c2d1ee09"
>>> +
>>> +EXTRA_OEMAKE = "-e MAKEFLAGS="
>>> +
>>> +do_install() {
>>> +       install -d ${D}${base_bindir} ${D}${mandir}/man1
>>> +       install -m 755 stat ${D}${base_bindir}/stat.stat
>>> +       install -m 644 stat.1 ${D}${mandir}/man1
>>> +}
>>> +
>>> +inherit update-alternatives
>>> +
>>> +ALTERNATIVE_${PN} = "stat"
>>> +ALTERNATIVE_PRIORITY[stat] = "200"
>>> +ALTERNATIVE_LINK_NAME[stat] = "${base_bindir}/stat"
>>> +ALTERNATIVE_TARGET[stat] = "${base_bindir}/stat.stat"
>>> +
>>> +ALTERNATIVE_${PN}-doc = "stat.1"
>>> +ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
>>> +
>>> +BBCLASSEXTEND = "native"
>>> +
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>>

