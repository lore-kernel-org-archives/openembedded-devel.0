Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OwPFq-0006Hd-IR
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 02:59:42 +0200
Received: by pwj1 with SMTP id 1so600021pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 17:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=/FXM8+DoiDo6X+Y7D2cjzZOJz5XSN8ko+friAjwRYvw=;
	b=tqjSUNNmFreaOQbkHxDsYY2jylpZaeylrZ+6QD16oaOR2Pc77jnUHsmPD3llJN+3Ny
	hFzZeVqBnGDb7Z3W+ZhG6kAl+1hOe4Tc0Uk5O+obA0fjcnKFZ1iTd+mEe43/3i0N93P8
	Q4FoWr0s/oPA3htMydrf7fdKCoaDLkM7RFKaI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=ontfcE7QbSAm7Ygku6tLXEJklhOij6JLEamdJuhXF9Tcwg5p6Erf2RdxfOgfd+Y+ep
	M/18dP/01bYW8eYaTbdGO6UzAgbMn2c3WaTyyomAdqSft0kOMgdnJSY3OZvi9rsSQHDN
	we4Etk5NjLgB/qrOZFxOr8WxYMrLFe3c3ykiA=
Received: by 10.114.131.6 with SMTP id e6mr4617859wad.90.1284684950765;
	Thu, 16 Sep 2010 17:55:50 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id d2sm5418838wam.14.2010.09.16.17.55.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Sep 2010 17:55:49 -0700 (PDT)
Message-ID: <4C92BC90.3090900@gmail.com>
Date: Fri, 17 Sep 2010 10:25:44 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: openmoko-theme-standard2_svn.bb and openmoko_two_get_license() wrong SECTION
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
X-List-Received-Date: Fri, 17 Sep 2010 01:00:41 -0000
X-List-Received-Date: Fri, 17 Sep 2010 01:00:41 -0000
X-List-Received-Date: Fri, 17 Sep 2010 01:00:41 -0000
X-List-Received-Date: Fri, 17 Sep 2010 01:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I saw a strange failure in bitbake- k world logs for mipsel/qemumipsel,
so I added a print statement to openmoko_two_get_license().

def openmoko_two_get_license(d):
    print "~~~~~~~~~~~"
    print "SECTION=%s" % bb.data.getVar('SECTION', d, 1)
    print "~~~~~~~~~~~"
    openmoko, section = bb.data.getVar('SECTION', d, 1).split("/")
    return "LGPL GPL".split()[section != "libs"]


grg@eye7:~/oe2$ bitbake -b openembedded/recipes/openmoko2/openmoko-theme-standard2_svn.bb
NOTE: oestats: error starting build, disabling stats
NOTE: Preparing runqueue
NOTE: Executing runqueue
~~~~~~
SECTION=devel
~~~~~~~~~~~
ERROR: Task 17 (/home/grg/oe2/openembedded/recipes/openmoko2/openmoko-theme-standard2_svn.bb, do_package_write_ipk) failed with exit code '1'
NOTE: Running task 11 of 19 (ID: 17, /home/grg/oe2/openembedded/recipes/openmoko2/openmoko-theme-standard2_svn.bb, do_package_write_ipk)
NOTE: package openmoko-theme-standard2-0.1.1+svnr4338-r6: task do_package_write_ipk: Started
ERROR: Error evaluating '${@openmoko_two_get_license(d)}'
Traceback (most recent call last):
  File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 84, in expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 71, in python_sub
    value = utils.better_eval(codeobj, {"d": self})
  File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 357, in better_eval
    return eval(source, _context, locals)
  File "LICENSE", line 1, in <module>
  File "openmoko2.bbclass", line 5, in openmoko_two_get_license
ValueError: need more than 1 value to unpack

ERROR: Error executing python function in 'do_package_ipk'
Traceback (most recent call last):
  File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 334, in better_exec
    exec(code, _context, context)
  File "do_package_ipk", line 175, in <module>
  File "do_package_ipk", line 103, in do_package_ipk
  File "do_package_ipk", line 93, in pullData
  File "/home/grg/oe2/bitbake/lib/bb/data.py", line 87, in getVar
    return d.getVar(var, exp)
  File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 226, in getVar
    return self.expand(value, var)
  File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 84, in expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File "/home/grg/oe2/bitbake/lib/bb/data_smart.py", line 71, in python_sub
    value = utils.better_eval(codeobj, {"d": self})
  File "/home/grg/oe2/bitbake/lib/bb/utils.py", line 357, in better_eval
    return eval(source, _context, locals)
  File "LICENSE", line 1, in <module>
  File "openmoko2.bbclass", line 5, in openmoko_two_get_license
ValueError: need more than 1 value to unpack

ERROR: Printing the environment of the function
ERROR:  0001:def do_package_ipk(d):
ERROR:  0002:   import re, copy
ERROR:  0003:
ERROR:  0004:   workdir = bb.data.getVar('WORKDIR', d, 1)
ERROR:  0005:   if not workdir:
ERROR:  0006:           bb.error("WORKDIR not defined, unable to package")
ERROR:  0007:           return
ERROR:  0008:
ERROR:  0009:
ERROR: Logfile of failure stored in: /mnt/oe/tmp/work/all-oe-linux/openmoko-theme-standard2-0.1.1+svnr4338-r6/temp/log.do_package_ipk.13541
Log data follows:
| ~~~~~~~~~~~
| SECTION=devel
| ~~~~~~~~~~~
NOTE: package openmoko-theme-standard2-0.1.1+svnr4338-r6: task do_package_ipk: Failed
ERROR: Function 'do_package_ipk' failed (see /mnt/oe/tmp/work/all-oe-linux/openmoko-theme-standard2-0.1.1+svnr4338-r6/temp/log.do_package_ipk.13541 for further information)



Clearly, openmoko-theme-standard2_svn.bb has SECTION="openmoko/base".
Where does "devel" come from?

-Graham


