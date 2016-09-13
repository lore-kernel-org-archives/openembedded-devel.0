Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE3A771F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 12:34:30 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so4892626wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 05:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=MZLQ0MDJ0KO8BKl3bV0FWTg6yO0eY9BiAV6DVVbemfw=;
	b=no0xVhDY4N7Xe3q85DtAkoBtMrjqTBO+e9MWShcTOPvdLOCKnfgCvUXoDe7powoEJQ
	UdMEf6LTjGwX5metbTDm5MqEdu6VcpK+bjU9tPLH+WHWaSjoq/rvwvOj/pXS1VglgErR
	tLEVrjdE7gD54CtBvpW8SXxfgn6fJvn9CY+L/6DHpj8bbe1l93+ObKnfr5rXB6C7X7PI
	yap5DfCbxCEQfV2le8LA5G0Zxg3qg9JWmHOpVAMsYE8JVYfrztu4FRuiTKfo2B6GWBVo
	yEQFeSUE9LgMP70SJJT6lzkMFbvP7tyq5gKb0gJWGJoaAbslggzkuvAKZzEZITr5pEIX
	2/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=MZLQ0MDJ0KO8BKl3bV0FWTg6yO0eY9BiAV6DVVbemfw=;
	b=m5OGVLQqajYF6DtykYwxIIm0vvqkPDfcdQEwGhwEs5RPBpoVVFX4exeg2YoCq5pP/h
	LfgW2zGN5H/I/nxxb8LKeqpXm0KijZgaMyjtLdFUNuOCtUjO++cc/RX7zrNHztxRlh6j
	EsLgblEdQ4zqxZnKmg11SK3cwxG2EMdOxk1vXqcGpfR5ChO09xlv6TidRtBfpT8zok12
	nTig3amPYXhgCEt6XbWYhqxhf7R6rLQEFVtxKhkenlZWLzeJAN6h6Y4u5BC5XLqPT3tm
	A64bNLuXeeO6OjOiNrgRqXdg50ZBjteQJBYU+ZuTAWMDUya1Cr9XC7sYSKxo4PddlrFe
	lB5A==
X-Gm-Message-State: AE9vXwOom3qkfoVJCvYiELBVo2G/Kby5UEvXpUFK4B49C1vvlfDTp3sI+kPd37yP6Fkcq3QKn3lUOOIE1fmUGA==
X-Received: by 10.194.95.105 with SMTP id dj9mr21836575wjb.20.1473770070212;
	Tue, 13 Sep 2016 05:34:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.143 with HTTP; Tue, 13 Sep 2016 05:34:09 -0700 (PDT)
In-Reply-To: <20160913122559.GA23801@mbabyjoh-desk.ger.corp.intel.com>
References: <20160913121749.11771-1-ricardo.ribalda@gmail.com>
	<20160913122559.GA23801@mbabyjoh-desk.ger.corp.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 13 Sep 2016 14:34:09 +0200
Message-ID: <CAPybu_1BPtknTcp74m+NC_aPd_Rg8kMybbxTFLpKin7exK_KbQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 1/2] xpp2: Remove bashism
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
X-List-Received-Date: Tue, 13 Sep 2016 12:34:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi Maxin


My bad, I did not checkout the repo state today.

Anyway, it does not completely does the job. it is missing


diff --git a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
index f264022ffe60..808a9372338f 100644
--- a/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
+++ b/recipes-core/xml-commons/xpp3_1.1.3.4.O.bb
@@ -33,7 +33,7 @@ do_compile() {
     mkdir -p build-xpath

     sourcepath="src/java/xpath"
-    findpath="${sourcepath//:/ }"
+    findpath=${sourcepath}
     javac -sourcepath $sourcepath -cp build-oe -d build-xpath `find
$findpath -name "*.java"`

     fastjar -C build-xpath -c -f xpp3-xpath-${PV}.jar .


without that, I get this error:

og data follows:
| DEBUG: Executing shell function do_compile
| ----------
| 1. WARNING in
src/java/api/org/xmlpull/v1/XmlPullParserException.java (at line 11)
| public class XmlPullParserException extends Exception {
|             ^^^^^^^^^^^^^^^^^^^^^^
| The serializable class XmlPullParserException does not declare a
static final serialVersionUID field of type long
| ----------
| ----------



I will resend the patch


Thanks!

On Tue, Sep 13, 2016 at 2:26 PM, Maxin B. John <maxin.john@intel.com> wrote:
> Hi Ricardo,
>
> On Tue, Sep 13, 2016 at 02:17:48PM +0200, Ricardo Ribalda Delgado wrote:
>> ERROR: xpp2-2.1.10-r0 do_compile: Function failed: do_compile (log file
>>               is located at
>> /var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/log.do_compile.6694)
>> ERROR: Logfile of failure stored in:
>> /var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/log.do_compile.6694
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> |
>> /var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/run.do_compile.6694:
>> 109:
>> /var/lib/jenkins/workspace/qt5022-cesium/build/tmp/work/all-poky-linux/xpp2/2.1.10-r0/temp/run.do_compile.6694:
>> Bad substitution
>> | WARNING: exit code 2 from a shell command.
>>
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>>  recipes-core/xml-commons/xpp2_2.1.10.bb | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/recipes-core/xml-commons/xpp2_2.1.10.bb b/recipes-core/xml-commons/xpp2_2.1.10.bb
>> index d3baca436b60..32457ddf899c 100644
>> --- a/recipes-core/xml-commons/xpp2_2.1.10.bb
>> +++ b/recipes-core/xml-commons/xpp2_2.1.10.bb
>> @@ -18,8 +18,7 @@ do_compile() {
>>      mkdir -p build-oe
>>
>>      sourcepath="src/java/drivers/jaxp11:src/java/drivers/sax2:src/java/impl/factory:src/java/impl/format:src/java/impl/node:src/java/impl/pullparser:src/java/impl/tag:src/java/intf"
>> -
>> -    findpath="${sourcepath//:/ }"
>> +    findpath="src/java/drivers/jaxp11 src/java/drivers/sax2 src/java/impl/factory src/java/impl/format src/java/impl/node src/java/impl/pullparser src/java/impl/tag src/java/intf"
>>
>>      javac -sourcepath $sourcepath -d build-oe `find $findpath -name "*.java"`
>
> Merged a similar fix yesterday.
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=aa3c79568dfaeb9c8747d49d12ac0396eaf6a4ea
>
> Please pull the latest master branch and see if this happens again.
>
> Thanks,
> Maxin
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Ricardo Ribalda

