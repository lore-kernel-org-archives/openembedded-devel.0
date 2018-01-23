Return-Path: <cshored@thecshore.com>
Received: from smtp113.iad3a.emailsrvr.com (smtp113.iad3a.emailsrvr.com
	[173.203.187.113])
	by mail.openembedded.org (Postfix) with ESMTP id 6438978645
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:50:55 +0000 (UTC)
Received: from smtp23.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
	by smtp23.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	D879A2528C for <Openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 01:50:56 -0500 (EST)
X-Auth-ID: highvolume@thecshore.com
Received: by smtp23.relay.iad3a.emailsrvr.com (Authenticated sender:
	highvolume-AT-thecshore.com) with ESMTPSA id 9B92C25272
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 01:50:56 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thecshore.com;
	s=20170504; t=1516690256;
	bh=UbyAQC8qUQx1OUbAM4nUDPQp+9paBj96viuJAF6u/bo=;
	h=To:From:Subject:Date:From;
	b=coLqhTx/NJqTn7WNrGAvBxRGNkiWG3PLtBq7hvNgWhWfacbKa/q6nMeBMX9kO4Ax+
	40Zv+Ti/UyzAsOuq1bl6OZjpcRyMNS2LalWVXbwUsdimS/V3DywpValiXROD4jVSYQ
	ZYwm3oN+w0Ofz5pjgop0FS8upBvxmpZYmA3M5Kgo=
X-Sender-Id: highvolume@thecshore.com
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.12); Tue, 23 Jan 2018 01:50:56 -0500
To: Openembedded-devel@lists.openembedded.org
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <2e13c129-8fef-f0c9-a8d7-7645505370bf@thecshore.com>
Date: Tue, 23 Jan 2018 01:50:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
Subject: [meta-oe] add-layers fails with python error
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
X-List-Received-Date: Tue, 23 Jan 2018 06:50:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

I'm not sure which list this belongs on, but since it's an attempt to 
use meta-oe that triggers the error, I post it here.  I've seen others 
reporting this issue prior to this, so perhaps it's related to the build 
environment?  (I'm on Debian 9).

Steps:

Checkout bitbake branch 1.34 (also occurs with 1.32 & 1.36)
Checkout oe-core master (also occurs with rocko)
Checkout meta-openembedded master (also occurs with rocko)

source oe-init-env

bitbake-layers add-layer /path/to/meta-openembedded/meta-oe

The follow traceback is shown:

ERROR: Execution of event handler 'base_eventhandler' failed
Traceback (most recent call last):
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler
     if isinstance(e, bb.event.MultiConfigParsed):
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'
ERROR: Error parsing configuration files
Traceback (most recent call last):
   File "/home/oeuser/openembedded/bitbake/lib/bb/cookerdata.py", line 
274, in parseBaseConfiguration
     bb.event.fire(bb.event.ConfigParsed(), self.data)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 211, 
in fire
     fire_class_handlers(event, d)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 134, 
in fire_class_handlers
     execute_handler(name, handler, event, d)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 106, 
in execute_handler
     ret = handler(event)
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler
     if isinstance(e, bb.event.MultiConfigParsed):
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'
ERROR: Execution of event handler 'base_eventhandler' failed
Traceback (most recent call last):
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler
     if isinstance(e, bb.event.MultiConfigParsed):
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'
Traceback (most recent call last):
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler(e=<bb.event.ConfigParsed object at 
0x7fd521e79a90>):

     >    if isinstance(e, bb.event.MultiConfigParsed):
              # We need to expand SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in 
each of the multiconfig data stores
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'

ERROR: Execution of event handler 'base_eventhandler' failed
Traceback (most recent call last):
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler
     if isinstance(e, bb.event.MultiConfigParsed):
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'
Traceback (most recent call last):
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler(e=<bb.event.ConfigParsed object at 
0x7fd521e79a90>):

     >    if isinstance(e, bb.event.MultiConfigParsed):
              # We need to expand SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in 
each of the multiconfig data stores
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'

ERROR: Error parsing configuration files
Traceback (most recent call last):
   File "/home/oeuser/openembedded/bitbake/lib/bb/cookerdata.py", line 
274, in parseBaseConfiguration
     bb.event.fire(bb.event.ConfigParsed(), self.data)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 211, 
in fire
     fire_class_handlers(event, d)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 134, 
in fire_class_handlers
     execute_handler(name, handler, event, d)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 106, 
in execute_handler
     ret = handler(event)
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler
     if isinstance(e, bb.event.MultiConfigParsed):
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'
Traceback (most recent call last):
   File "/home/oeuser/openembedded/bitbake/lib/bb/cookerdata.py", line 
274, in CookerDataBuilder.parseBaseConfiguration():

     >            bb.event.fire(bb.event.ConfigParsed(), self.data)

   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 211, 
in fire(event=<bb.event.ConfigParsed object at 0x7fd521e79a90>, 
d=<bb.data_smart.DataSmart object at 0x7fd521e6ac50>):

     >    fire_class_handlers(event, d)
          if worker_fire:
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 134, 
in fire_class_handlers(event=<bb.event.ConfigParsed object at 
0x7fd521e79a90>, d=<bb.data_smart.DataSmart object at 0x7fd521e6ac50>):
                          continue
     >            execute_handler(name, handler, event, d)

   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 106, 
in execute_handler(name='base_eventhandler', handler=<function 
base_eventhandler at 0x7fd521a43048>, event=<bb.event.ConfigParsed 
object at 0x7fd521e79a90>, d=<bb.data_smart.DataSmart object at 
0x7fd521e6ac50>):
          try:
     >        ret = handler(event)
          except (bb.parse.SkipRecipe, bb.BBHandledException):
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler(e=<bb.event.ConfigParsed object at 
0x7fd521e79a90>):

     >    if isinstance(e, bb.event.MultiConfigParsed):
              # We need to expand SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in 
each of the multiconfig data stores
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'

ERROR: Error parsing configuration files
Traceback (most recent call last):
   File "/home/oeuser/openembedded/bitbake/lib/bb/cookerdata.py", line 
274, in parseBaseConfiguration
     bb.event.fire(bb.event.ConfigParsed(), self.data)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 211, 
in fire
     fire_class_handlers(event, d)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 134, 
in fire_class_handlers
     execute_handler(name, handler, event, d)
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 106, 
in execute_handler
     ret = handler(event)
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler
     if isinstance(e, bb.event.MultiConfigParsed):
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'
Traceback (most recent call last):
   File "/home/oeuser/openembedded/bitbake/lib/bb/cookerdata.py", line 
274, in CookerDataBuilder.parseBaseConfiguration():

     >            bb.event.fire(bb.event.ConfigParsed(), self.data)

   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 211, 
in fire(event=<bb.event.ConfigParsed object at 0x7fd521e79a90>, 
d=<bb.data_smart.DataSmart object at 0x7fd521e6ac50>):

     >    fire_class_handlers(event, d)
          if worker_fire:
   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 134, 
in fire_class_handlers(event=<bb.event.ConfigParsed object at 
0x7fd521e79a90>, d=<bb.data_smart.DataSmart object at 0x7fd521e6ac50>):
                          continue
     >            execute_handler(name, handler, event, d)

   File "/home/oeuser/openembedded/bitbake/lib/bb/event.py", line 106, 
in execute_handler(name='base_eventhandler', handler=<function 
base_eventhandler at 0x7fd521a43048>, event=<bb.event.ConfigParsed 
object at 0x7fd521e79a90>, d=<bb.data_smart.DataSmart object at 
0x7fd521e6ac50>):
          try:
     >        ret = handler(event)
          except (bb.parse.SkipRecipe, bb.BBHandledException):
   File 
"/home/oeuser/openembedded/oe-core-procd/meta/classes/base.bbclass", 
line 238, in base_eventhandler(e=<bb.event.ConfigParsed object at 
0x7fd521e79a90>):

     >    if isinstance(e, bb.event.MultiConfigParsed):
              # We need to expand SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in 
each of the multiconfig data stores
AttributeError: module 'bb.event' has no attribute 'MultiConfigParsed'




-- 
https://www.thecshore.com

