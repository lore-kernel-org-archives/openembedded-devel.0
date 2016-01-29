Return-Path: <Paul.Vaduva@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 9EF5E771C7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:50:11 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 29 Jan 2016 13:50:11 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4538)	id D098E28BA23;
	Fri, 29 Jan 2016 13:50:11 +0100 (CET)
From: Paul Vaduva <Paul.Vaduva@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jan 2016 13:50:08 +0100
Message-ID: <1454071809-2040-1-git-send-email-Paul.Vaduva@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: Paul.Vaduva@enea.com does not
	designate permitted sender hosts)
Subject: [meta-oe][PATCHv1 0/1] ptest for lua output
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
X-List-Received-Date: Fri, 29 Jan 2016 12:50:13 -0000
Content-Type: text/plain

--- test output ---
current path:
****/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;/usr/lib/lua/5.3/?.lua;/usr/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua****

    ---- total memory: 38.5K, max memory: 38.5K ----

time: 0.000645 (+0.000645)

***** FILE 'main.lua'*****

***** FILE 'gc.lua'*****
testing garbage collection
tables
strings
functions
functions with errors
long strings
steps
steps (2)
clearing tables
weak tables
+
self-referenced threads
OK
    ---- total memory: 1.8M, max memory: 1.8M ----

time: 2.81585 (+2.81521)

***** FILE 'db.lua'*****
testing debug library and debug information
+
+
+
testing traceback sizes
testing debug functions on chunk without debug info
OK
    ---- total memory: 329.4K, max memory: 1.8M ----

time: 4.94329 (+2.12744)

***** FILE 'calls.lua'*****
testing functions and calls
+
+
+
+
testing binary chunks
OK
testing strings and string library
testing 'format %a %A'
OK
testing scanner
+
+
+
+
+
OK
    ---- total memory: 344.9K, max memory: 1.8M ----

time: 5.50336 (+0.560066)

***** FILE 'tpack.lua'*****
testing pack/unpack
platform:
        short 2, int 4, long 4, size_t 4, float 4, double 8,
        lua Integer 8, lua Number 8
        little endian
        alignment: 4
testing invalid formats
testing pack/unpack of floating-point numbers
testing pack/unpack of strings
testing alignment
OK
    ---- total memory: 546.3K, max memory: 1.8M ----

time: 5.57451 (+0.071148)

***** FILE 'attrib.lua'*****
testing require
package config: /|;|?|!|-|
+
testing assignments, logical operators, and constructors
+
OK
    ---- total memory: 798.7K, max memory: 1.8M ----

time: 5.6609 (+0.086399)

***** FILE 'locals.lua'*****
testing local variables and environments
+
OK
    ---- total memory: 271.3K, max memory: 1.8M ----

time: 6.05418 (+0.393272)

***** FILE 'constructs.lua'*****
testing syntax
+
testing short-circuit optimizations (0)
+
OK
    ---- total memory: 1.7M, max memory: 1.8M ----

time: 7.51129 (+1.45711)

***** FILE 'code.lua'*****
    ---- total memory: 1.7M, max memory: 1.8M ----

time: 7.52838 (+0.017094)

***** FILE 'nextvar.lua'*****
testing tables, next, and for
+
+
+
+
testing floats in numeric for
OK
    ---- total memory: 107.2K, max memory: 1.8M ----

time: 8.07731 (+0.548928)

***** FILE 'pm.lua'*****
testing pattern matching
+
+
+
+
OK
    ---- total memory: 716.2K, max memory: 1.8M ----

time: 8.41998 (+0.342666)

***** FILE 'utf8.lua'*****
testing UTF-8 library
ok
    ---- total memory: 768.2K, max memory: 1.8M ----

time: 8.45222 (+0.032244)

***** FILE 'api.lua'*****
    ---- total memory: 978.4K, max memory: 1.8M ----

time: 8.50493 (+0.052707)

***** FILE 'events.lua'*****
testing metatables
+
+
OK
    ---- total memory: 115.3K, max memory: 1.8M ----

time: 8.57888 (+0.073951)

***** FILE 'vararg.lua'*****
testing vararg
+
+
+
OK
    ---- total memory: 155.2K, max memory: 1.8M ----

time: 8.59075 (+0.011875)

***** FILE 'closure.lua'*****
testing closures
+
OK
    ---- total memory: 170.7K, max memory: 1.8M ----

time: 8.77789 (+0.187133)

***** FILE 'coroutine.lua'*****
testing coroutines
+
testing yields inside metamethods
+
testing yields inside 'for' iterators
    ---- total memory: 665.3K, max memory: 1.8M ----

time: 8.85965 (+0.081763)

***** FILE 'goto.lua'*****
OK
    ---- total memory: 107.8K, max memory: 1.8M ----

time: 8.87419 (+0.014536)

***** FILE 'errors.lua'*****
testing errors
+
testing tokens in error messages
+
OK
    ---- total memory: 183.4K, max memory: 1.8M ----

time: 9.1838 (+0.309612)

***** FILE 'math.lua'*****
testing numbers and math lib
64-bit integers, 53-bit (mantissa) floats
testing order (floats cannot represent all integers)
testing -0 and NaN
testing 'math.random'
OK
    ---- total memory: 382.0K, max memory: 1.8M ----

time: 9.32606 (+0.142265)

***** FILE 'sort.lua'*****
testing (parts of) table library
testing unpack
testing pack
testing sort
sorting 5000 random elements in 145.17 msec.
re-sorting 5000 sorted elements in 122.21 msec.
Invert-sorting other 5000 elements in 439.12 msec., with 66027 comparisons
sorting 5000 equal elements in 269.07 msec.
OK
    ---- total memory: 201.1K, max memory: 1.8M ----

time: 10.7128 (+1.38671)

***** FILE 'bitwise.lua'*****
testing bitwise operations
+
testing bitwise library
+
+
OK
    ---- total memory: 263.1K, max memory: 1.8M ----

time: 10.7588 (+0.046013)

***** FILE 'verybig.lua'*****
testing RK
    ---- total memory: 91.4K, max memory: 1.8M ----

time: 10.7689 (+0.010152)

***** FILE 'files.lua'*****
testing i/o
+
true
+
+
+
+
+
testing date/time
test done on 28/01/2016, at 14:48:48
Lua 5.3
64-bit integers, 64-bit floats
cleaning all!!!!
    ---- total memory: 41.2K, max memory: 1.8M ----



total time: 11.25s (wall time: 12s)

final OK !!!
>>> closing state <<<



--- ptest result ---
PASS: lua
root@qemux86:/usr/lib/lua-test/ptest#

Paul Vaduva (1):
  lua: Added ptest for lua

 meta-oe/recipes-devtools/lua/lua-test/run-ptest | 19 +++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua-test_5.3.2.bb  | 22 ++++++++++++++++++++++
 meta-oe/recipes-devtools/lua/lua_5.3.2.bb       |  3 +++
 3 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lua/lua-test/run-ptest
 create mode 100644 meta-oe/recipes-devtools/lua/lua-test_5.3.2.bb

-- 
1.9.1


