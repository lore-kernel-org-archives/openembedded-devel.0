Return-Path: <amery@hanoverdisplays.com>
Received: from mail.hanoverdisplays.com (mail.hanoverdisplays.com [62.7.92.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33FBE777FA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 13:35:39 +0000 (UTC)
X-GFI-TNEF2MIME: 1.2
Received: from MAILDB.hanover.local ([fe80::6c2c:e4ad:bf0a:351d]) by
	mail.hanover.local ([fe80::1440:163c:a37d:4312%11]) with mapi id
	14.03.0319.002; Sat, 4 Mar 2017 13:35:40 +0000
From: Alejandro Mery <amery@hanoverdisplays.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] gitver: fix try/except syntax for python3
	support
Thread-Index: AQHSkpbLUJTTg42vW0S02nKyRjmbUw==
Date: Sat, 4 Mar 2017 13:35:40 +0000
Message-ID: <CF323D845261FD4F9B1E99738125033460DEF731@maildb.hanover.local>
References: <20170301141908.166857-1-amery@hanoverdisplays.com>
	<CF323D845261FD4F9B1E99738125033460DE2603@maildb.hanover.local>
	<20170304115347.GC3025@jama>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <CF323D845261FD4F9B1E99738125033460DEF731@maildb.hanover.local>
MIME-Version: 1.0
X-Originating-IP: [82.23.32.30]
Disclaimer: hanoverdisplays.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "amery@geeks.cl" <amery@geeks.cl>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gitver: fix try/except syntax for python3 support
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
X-List-Received-Date: Sat, 04 Mar 2017 13:35:41 -0000
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="part__AD06059F_D508_46F6_AD78_3DF183659"

--part__AD06059F_D508_46F6_AD78_3DF183659
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Disclaimer: hanoverdisplays.com

On 04/03/17 11:53, Martin Jansa wrote:
> On Wed, Mar 01, 2017 at 02:22:29PM +0000, Alejandro Mery wrote:
>> On 01/03/17 14:19, Alejandro Mery wrote:
>>> https://www.python.org/dev/peps/pep-3110/
>>>
>>> It's backward compatible with 2.6+
>>>
>>> Signed-off-by: Alejandro Mery <amery@hanoverdisplays.com>
>>> ---
>>>  meta-oe/classes/gitver.bbclass | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbc=
lass
>>> index e7b5155ee..b677996ea 100644
>>> --- a/meta-oe/classes/gitver.bbclass
>>> +++ b/meta-oe/classes/gitver.bbclass
>>> @@ -27,13 +27,13 @@ def get_git_pv(path, d, tagadjust=3DNone):
>>>      gitdir =3D os.path.abspath(os.path.join(d.getVar("S", True), ".git"=
))
>>>      try:
>>>          ver =3D gitrev_run("git describe --tags", gitdir)
>>> -    except Exception, exc:
>>> +    except Exception as exc:
>>>          bb.fatal(str(exc))
>>>
>>>      if not ver:
>>>          try:
>>>              ver =3D gitrev_run("git rev-parse --short HEAD", gitdir)
>>> -        except Exception, exc:
>>> +        except Exception as exc:
>>>              bb.fatal(str(exc))
>>>
>>>          if ver:
>> I forgot to mention, I'm having this problem using `morty`
> Next time, please send version applicable and tested in master branch firs=
t, then
> you can request backport to morty.

sorry about that. does it help to send (tested) patches against both?
(master and morty) or backporting only happens after the change goes
from master-next into master anyway?


> I've applied this manually to master-next now.

thank you


--part__AD06059F_D508_46F6_AD78_3DF183659--
